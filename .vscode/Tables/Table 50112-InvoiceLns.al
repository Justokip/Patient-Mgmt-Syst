table 50112 "Invoice Lns"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Invoice Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Code';



        }
        field(2; "Description"; text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Editable = FALSE;
        }
        field(3; "Invoiced Amount"; Decimal)
        {
            Caption = 'Invoiced Amount';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(4; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(5; "Balancing Acc. No."; Code[20])
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
        field(6; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(7; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(8; "Account No"; Code[50])
        {
            Caption = 'Account No';
            DataClassification = CustomerContent;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting), Blocked = const(false))
            else

            if ("Account Type" = const("G/L Account")) "G/L Account"

            else

            if ("Account Type" = const(Customer)) customer

            else

            if ("Account Type" = const(vendor)) vendor

            else

            if ("Account Type" = const(patient)) Customer;

        }
        field(9; "Applies-to Doc. No."; Code[50])
        {
            Caption = 'Applies-to Doc. No.';
            DataClassification = CustomerContent;
        }
        field(10; "Applies-to Doc. Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Applies-to Doc. Type';
            trigger OnValidate()
            begin
                if "Applies-to Doc. Type" <> xRec."Applies-to Doc. Type" then
                    Validate("Applies-to Doc. No.", '');
            end;
        }

    }

    keys
    {
        key(pk; "Invoice Code", LineNo)
        {
            Clustered = true;
        }
    }
}