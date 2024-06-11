table 50101 "Hospital Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Hospital Setup';

    fields
    {
        field(1; "Primary Keys"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Keys';
        }
        field(2; "Admission No"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = ' Admission No';
            TableRelation = "No. Series";
        }
        field(3; "Entry Code"; Code[50])
        {
            Caption = 'Entry Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(4; "General Journal Template"; Code[100])
        {
            Caption = 'General Journal Template';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
        }
        field(5; "General Journal Batch"; Code[100])
        {
            Caption = 'General Journal Batch';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("General Journal Template"));
        }
        field(6; "Invoicing GL Account"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoicing GL Account';
            TableRelation = "G/L Account";
        }
        field(7; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(8; "VAT Prod. Posting Group"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(9; "Inventory Posting Group"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(10; "Lab Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Lab Code';

        }
        field(11; "Medicine Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Pharmaceutical Code';
            TableRelation = "No. Series";
        }
        field(12; "Medical fee code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Charges Code';
            TableRelation = "No. Series";

        }
        field(13; "Age"; Integer)
        {
            Caption = 'Age';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(14; "setup code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Setup Code';
            TableRelation = "No. Series";

        }
        field(15; "Receipt code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt Code';
            TableRelation = "No. Series";
        }
        field(16; "Rcpt Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt Number';
            TableRelation = "No. Series";
        }
        field(17; "Sym Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sym Code';
            TableRelation = "No. Series";
        }
        field(18; "Diag Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Diag Code';
            TableRelation = "No. Series";
        }
        field(19; "exam code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Exam code';
            TableRelation = "No. Series";
        }
        field(20; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(21; "Balancing Acc. No."; Code[20])
        {
            Caption = 'Balancing Acc. No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(22; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Post. Group';
            TableRelation = "Customer Posting Group";
            DataClassification = CustomerContent;
        }
        field(23; "Bank Account"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bank Account';
            DataClassification = CustomerContent;

        }
        field(24; "Fee Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Lab Code';
            TableRelation = "No. Series";
        }
        field(25; "Insurance Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Insurance Code';
            TableRelation = "No. Series";
        }
        field(26; "Item Journal Template"; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Journal Template';
            TableRelation = "Item Journal Template";
        }
        field(27; "Item Journal Batch"; Code[100])
        {
            Caption = 'Item Journal Batch';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Item Journal Template"));
        }
        field(28; "Receiving Bank Account"; Code[100])
        {
            Caption = 'Receiving Bank Account';
            TableRelation = "Bank Account";
        }
        field(29; "Receiving Bank Account No."; Code[100])
        {
            Caption = 'Receiving Bank Account No.';
            TableRelation = "G/L Account";
        }
        field(30; "Gen. Bus. Posting Group"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(31; "Location Code"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(32; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(33; "Minimum Payment"; Integer)
        {
            Caption = 'Minimum Payment';
            DataClassification = CustomerContent;
        }
        field(34; "Minimum year of birth"; Date)
        {
            Caption = 'Minimum Date of Birth';
            DataClassification = CustomerContent;
        }
        // field(35; "Consultation Fee"; Decimal)
        // {
        //     Caption = 'Consultation Fee';
        //     TableRelation = Consultation;
        //     DataClassification = CustomerContent;
        // }
    }

    keys
    {
        key(PK; "Primary Keys")
        {
            Clustered = true;
        }
    }


}