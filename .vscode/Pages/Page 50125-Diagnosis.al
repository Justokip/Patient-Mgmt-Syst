page 50125 "Diagnosis"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Diagnosis;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Diagnosis Code"; Rec."Diagnosis Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diagnosis Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
