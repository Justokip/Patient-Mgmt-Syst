table 50102 "Patient Invoice"
{
    Caption = 'Patient Invoice';
    DataClassification = CustomerContent;


    fields

    {
        field(1; "Entry Code"; Code[50])
        {
            Caption = 'Invoice Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Entry Code" <> xRec."Entry Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Entry Code");
                    NoseriesManagement.TestManual(HospitalSetup."Entry Code");
                end;
            end;
        }
        field(2; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            var
                pat1: Record Customer;
                Pat2: Record "Invoice Lns";
                Pat3: Record "Lab Results";
                pat4: Record Prescription;
                Pat5: Record Consultation;
                LINENO: Integer;

            begin
                if pat1.Get("Admission No") then begin
                    "Full Name" := pat1."Name";
                    Pat2.Reset();
                    Pat2.SetRange("Invoice Code", Rec."Entry Code");
                    Pat2.DeleteAll();
                    Pat3.Reset();
                    Pat3.SetRange("LR Code", REC."Admission No");
                    if Pat3.Find('-') then begin
                        repeat
                            Pat2.Init();
                            LINENO := 10000;
                            Pat2.LineNo += LINENO;
                            Pat2."Invoice Code" := Rec."Entry Code";
                            Pat2.Description := Pat3.Description;
                            Pat2."Invoiced Amount" := Pat3."Unit Cost";
                            Pat2."Account No" := Rec."Admission No";
                            Pat2."Account Type" := Pat2."Account Type"::Customer;
                            Pat2.Insert();
                        until Pat3.Next() = 0;
                    end;
                end;
                if pat1.Get("Admission No") then begin
                    "Full Name" := pat1."Name";
                    Pat2.Reset();
                    Pat2.SetRange("Invoice Code", Rec."Entry Code");
                    pat4.Reset();
                    Pat4.SetRange("Prescription Code", REC."Admission No");
                    if pat4.Find('-') then begin
                        repeat
                            Pat2.Init();
                            LINENO := 10000;
                            Pat2."Invoice Code" := Rec."Entry Code";
                            Pat2.LineNo += LINENO;
                            Pat2.Description := pat4.Description;
                            Pat2."Invoiced Amount" := pat4.Cost;
                            Pat2."Account No" := Rec."Admission No";
                            Pat2."Account Type" := Pat2."Account Type"::Customer;
                            Pat2.Insert();
                        until pat4.Next() = 0;
                    end;
                end;
                if pat1.Get("Admission No") then begin
                    "Full Name" := pat1."Name";
                    Pat2.Reset();
                    Pat2.SetRange("Invoice Code", Rec."Entry Code");
                    Pat5.Reset();
                    Pat5.SetRange("consultation Code", REC."Admission No");
                    if Pat5.Find('-') then begin
                        repeat
                            Pat2.Init();
                            LINENO := 10000;
                            Pat2."Invoice Code" := Rec."Entry Code";
                            Pat2.LineNo += LINENO;
                            Pat2.Description := Pat5.Description;
                            Pat2."Invoiced Amount" := Pat5.Cost;
                            Pat2."Account No" := Rec."Admission No";
                            Pat2."Account Type" := Pat2."Account Type"::Customer;
                            Pat2.Insert();
                        until Pat5.Next() = 0;
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

        field(4; "Payment Type"; Text[50])
        {
            Caption = 'Payment Type';
            DataClassification = CustomerContent;
        }
        field(5; "Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Date';
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(8; "Invoiced Amount"; Decimal)
        {
            Caption = 'Invoiced Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Invoice Lns"."Invoiced Amount" where("Invoice Code" = field("Entry Code")));
        }

        field(9; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Status"; Enum "Approval Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
        field(11; "Post"; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Account No"; Code[50])
        {
            Caption = 'Account No';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry Code")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Entry Code", "Full Name", "Invoiced Amount")
        {
        }
        fieldgroup(Brick; "Entry Code", "Full Name", "Invoiced Amount")
        {
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
        if "Entry Code" = ' ' then
            HospitalSetup.TestField("Entry Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Entry Code", xRec."No. Series", 0D, "Entry Code", "No. Series");
        "Posting Date" := WorkDate();
    end;
}