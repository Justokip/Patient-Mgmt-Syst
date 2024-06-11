table 50114 "Patient Receipt"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Receipt code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt Code';
            Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Receipt code" <> xRec."Receipt code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Receipt code");
                    NoseriesManagement.TestManual(HospitalSetup."Receipt code");
                end;
            end;

        }
        field(2; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
            TableRelation = "Patient Invoice";
            trigger OnValidate()
            var
                rpt1: Record "Patient Invoice";
                rpt2: Record "Receipt Lns";
                rpt3: Record "Invoice Lns";
                //rpt4: Record "Patient Receipt";
                LINENO: Integer;


            begin
                if rpt1.Get("Admission No") then begin
                    "Full Name" := rpt1."Full Name";
                    "Account No" := rpt1."Admission No";
                    "Receipt Amount" := rpt1."Invoiced Amount";
                    rpt2.Reset();
                    rpt2.SetRange("Rcpt Code", "Receipt code");
                    rpt2.DeleteAll();
                    rpt3.Reset();
                    rpt3.SetRange("Invoice Code", "Admission No");
                    if rpt3.Find('-') then begin
                        repeat
                            rpt2.Init();
                            LINENO := 1000;
                            rpt2.LineNo += LINENO;
                            rpt2."Rcpt Code" := rec."Receipt code";
                            rpt2.Description := rpt3.Description;
                            rpt2.Cost := rpt3."Invoiced Amount";
                            rpt2."Account No" := Rec."Account No";
                            rpt2."Account Type" := rpt2."Account Type"::Customer;
                            rpt2.Insert();
                        until rpt3.Next() = 0;
                    end;

                end;
            end;

        }
        field(3; "Full Name"; Text[150])
        {
            Caption = 'Full Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Payment Method"; Code[20])
        {
            Caption = 'Payment Method';
            TableRelation = "Payment Setup";
            DataClassification = CustomerContent;
        }
        field(5; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
            DataClassification = CustomerContent;
        }
        field(6; "Status"; Enum "Approval Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
        field(7; "Post"; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Receipt Amount"; Decimal)
        {
            Caption = 'Receipt Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Receipt Lns".Cost where("Rcpt Code" = field("Receipt code")));

        }
        field(9; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(11; "Bank Account Number"; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = CustomerContent;
        }
        field(12; "Medical Cover"; code[50])
        {
            Caption = 'Medical Cover';
            TableRelation = "Medical Cover";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                ins: Record "Medical Cover";
            begin
                if ins.Get("Medical Cover") then begin
                    "Medical Cover" := ins."Insurance Type";
                end;
            end;
        }
        field(13; "Bank Account"; Code[50])
        {
            Caption = 'Bank Account';
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                bnk: Record "Bank Account";
            begin
                if bnk.Get("Bank Account") then begin
                    "Bank Account Number" := bnk."Bank Account No."
                end;
            end;

        }
        field(14; "Account Type"; Code[50])
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(15; "Account No"; Code[50])
        {
            Caption = 'Account No';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; "Receipt code")
        {
            Clustered = true;
        }
    }
    var

        HospitalSetup: Record "Hospital Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        HospitalSetup: Record "Hospital Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        HospitalSetup.Get();
        if "Receipt code" = ' ' then
            HospitalSetup.TestField("Receipt code");
        NoSeriesManagement.InitSeries(HospitalSetup."Receipt code", xRec."No. Series", 0D, "Receipt code", "No. Series");
        "Posting Date" := WorkDate();
        "Receipt Date" := WorkDate();
    end;


}