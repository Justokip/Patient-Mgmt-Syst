table 50106 "Prescription"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Prescription Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Prescription Code';

        }
        field(2; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Description';
            trigger OnValidate()
            var
                Itmtyp: Record "Hosp Received Items";
            begin
                if Itmtyp.Get(Description) then begin
                    "Description" := Itmtyp.Description;
                end;
            end;


        }
        field(3; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Cost := "Unit Cost" * Quantity;
            end;
        }
        field(7; "Frequency"; Text[50])
        {
            Caption = 'Frequency';
            DataClassification = CustomerContent;
        }
        field(4; "Period"; text[50])
        {
            Caption = 'Period';
            DataClassification = CustomerContent;
        }
        field(5; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(6; "Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Cost';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Cost := "Unit Cost" * Quantity;
            end;

        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Cost := "Unit Cost" * Quantity;
            end;
        }
        field(8; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(EC; "Prescription Code", LineNo)
        {
            Clustered = true;
        }
    }
}