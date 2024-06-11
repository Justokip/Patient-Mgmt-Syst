page 50153 "Fee Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Fee Setup";

    layout
    {
        area(Content)
        {
            repeater(lines)
            {

                field("Fee Code"; Rec."Fee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
            }
        }
    }
}