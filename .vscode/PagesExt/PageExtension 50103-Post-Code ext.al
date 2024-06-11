pageextension 50103 PostcodeExt extends "Post Codes"
{
    layout
    {
        addafter(County)
        {

            field("Postal Address"; Rec."Postal Address")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the  Postal Address field.';
            }
        }

    }

    var
        myInt: Integer;
}