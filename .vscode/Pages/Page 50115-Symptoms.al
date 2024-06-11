page 50115 "Symptoms"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Symptoms;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Symptoms Code"; Rec."Symptoms Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Symptoms Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    TableRelation = "Symptoms Setup";
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}




