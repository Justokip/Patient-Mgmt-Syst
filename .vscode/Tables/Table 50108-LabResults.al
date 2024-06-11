table 50108 "Lab Results"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "LR Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'LR Code';

        }
        field(2; "Test Type"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Items Setup";
            Caption = 'Test Type';
            trigger OnValidate()
            var
                LabTest: Record "Items Setup";

            begin
                if LabTest.Get("Test Type") then begin
                    "Test Type" := LabTest."Test Type";
                    Description := LabTest.Description;
                    "Unit Cost" := LabTest."Unit Cost";
                end;
            end;
        }
        field(3; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(4; "Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Cost';
            Editable = false;
        }
        field(5; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(6; "Lab Results"; Enum "Lab Results")
        {
            Caption = 'Lab Results';
            DataClassification = CustomerContent;
        }
        field(7; "Lab Status"; Enum "Lab Tests")
        {
            Caption = 'Lab Status';
            DataClassification = CustomerContent;
        }
        field(8; "Comments"; Text[250])
        {
            Caption = 'Comments';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(EC; "LR Code", LineNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Test Type", "Description")
        {

        }
        fieldgroup(Brick; "Test Type", "Description")
        {

        }

    }
}
