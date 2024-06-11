table 50116 "Charges"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Medical fee code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Charges Code';
            //Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Medical fee code" <> xRec."Medical fee code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Medical fee code");
                    NoseriesManagement.TestManual(HospitalSetup."Medical fee code");
                end;
            end;
        }
        field(2; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(4; "Bank Account Number"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Type';
        }
        field(5; "Bank Account Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Name';
        }

        field(6; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(7; "Balancing Acc. No."; Code[20])
        {
            Caption = 'Balancing Acc. No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Bal.Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting), Blocked = const(false))
            else

            if ("Bal.Account Type" = const("G/L Account")) "G/L Account"

            else

            if ("Bal.Account Type" = const(Customer)) customer

            else

            if ("Bal.Account Type" = const(vendor)) vendor

            else

            if ("Bal.Account Type" = const("Bank Account")) "Bank Account";

        }

        field(8; "Payment Type"; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
        }
        field(9; "Recurring Change"; Boolean)
        {
            Caption = 'Recurring Change';
            DataClassification = CustomerContent;
        }
        field(10; "Amount Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount Sum';

        }
        field(11; "Serial Number"; Code[20])
        {
            Caption = 'S/NUMBER';
            DataClassification = CustomerContent;
        }
        field(12; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(pk; "Medical fee code")
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
        if "Medical fee code" = ' ' then
            HospitalSetup.TestField("Medical fee code");
        NoSeriesManagement.InitSeries(HospitalSetup."Medical fee code", xRec."No. Series", 0D, "Medical fee code", "No. Series");
    end;
}