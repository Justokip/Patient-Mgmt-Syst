table 50117 "Next of Kin"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Kin Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Kin Code';
        }
        field(2; "Name"; Code[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(4; "Gender"; Enum "Patient Gender")
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;
        }
        field(3; "Phone Numuber"; Text[50])
        {
            Caption = 'Phone Number';
            DataClassification = CustomerContent;
        }
        field(5; "ID/Passport Number"; Code[50])
        {
            Caption = 'ID/Passport Number';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                AppRec: Record "Next of Kin";
                i: Integer;
                IDNoCannotContainLetters: Label 'The ID No. must not have letters';
            begin
                AppRec.Reset();
                AppRec.SetRange("ID/Passport Number", Rec."ID/Passport Number");
                if AppRec.FindFirst() then
                    Error('The record with the ID No. %1 already exists', "ID/Passport Number");

                for i := 1 to StrLen("ID/Passport Number") do begin
                    if ("ID/Passport Number"[i] >= 'A') and ("ID/Passport Number"[i] <= 'Z') or
                       ("ID/Passport Number"[i] >= 'a') and ("ID/Passport Number"[i] <= 'z') then
                        FieldError("ID/Passport Number", IDNoCannotContainLetters);
                end;

                if StrLen("ID/Passport Number") < 7 then
                    Error('The ID No. must be more than 7 digits');

                if StrLen("ID/Passport Number") > 8 then
                    Error('The ID No. must be less than 8 digits');
            end;
        }
        field(6; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(kc; "Kin Code", LineNo)
        {
            Clustered = true;
        }
    }
}
