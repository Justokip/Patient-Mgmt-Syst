table 50104 "Examination"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Examination Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Examination Code';

        }
        field(2; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            TableRelation = "Examination Setup";
            Caption = 'Description';
            trigger OnValidate()
            var
                exam: Record "Examination Setup";
            begin
                if exam.Get(Description) then begin
                    
                    Description := exam.Description;
                end;
            end;
        }
        field(3; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(EC; "Examination Code", LineNo)
        {
            Clustered = true;
        }
    }
}