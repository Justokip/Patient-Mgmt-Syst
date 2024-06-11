page 50117 "Sysmptoms List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Symptoms;
    CardPageId = Symptoms;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Symptoms Code"; Rec."Symptoms Code")
                {
                    ApplicationArea = All;
                    Visible = false;
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