table 50105 "Symptoms"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Symptoms Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Symptoms Code';
            //Editable = false;

        }
        field(2; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            trigger OnValidate()
            var
                Sympt: Record "Symptoms Setup";
            begin
                if Sympt.Get(Description) then begin
                    Description := Sympt.Description;
                end;
            end;
        }
        field(4; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
        }
        field(3; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(EC; "Symptoms Code", LineNo)
        {
            Clustered = true;
        }
    }
}