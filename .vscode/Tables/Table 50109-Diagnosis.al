table 50109 "Diagnosis"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Diagnosis Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Diagnosis Code';

        }
        field(2; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
        }
        field(3; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            trigger OnValidate()
            var
                diag: Record "Diagnosis Setup";
            begin
                if diag.Get(Description) then begin
                    Description := diag.Description;
                end;
            end;
        }
        field(4; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(EC; "Diagnosis Code", LineNo)
        {
            Clustered = true;
        }
    }
}