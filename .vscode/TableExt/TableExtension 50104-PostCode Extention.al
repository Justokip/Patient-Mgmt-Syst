tableextension 50104 PostCodeExt extends "Post Code"

{
    fields
    {
        field(32; "Postal Address"; Text[100])
        {
            Caption = ' Postal Address';
            DataClassification = CustomerContent;
        }
    }
}