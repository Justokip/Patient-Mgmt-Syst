table 50107 "Consultation"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "consultation Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Consultation Code';

        }
        field(2; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "fee Setup";
            Caption = 'Description';
            trigger OnValidate()
            var
                conslt: Record "fee Setup";
            begin
                if conslt.Get(Description) then begin
                    Description := conslt.Description;
                    "Unit Cost" := conslt."Unit Cost"
                end;
            end;

        }
        field(3; "Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Cost';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Cost := "Unit Cost" * Quantity;
            end;

        }

        field(5; "Active"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Active';

        }
        field(6; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
        }
        field(7; "Quantity"; Decimal)
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
        field(8; "Cost"; Decimal)
        {
            Caption = 'Cost';
            Editable = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Cost := "Unit Cost" * Quantity;
            end;
        }
        field(9; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(pk; "consultation Code", LineNo)
        {
            Clustered = true;
        }
    }
}