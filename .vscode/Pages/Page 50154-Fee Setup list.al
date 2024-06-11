page 50154 "Fee Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Fee Setup";
    CardPageId = "Fee Setup";
    layout
    {
        area(Content)
        {
            repeater(Lines)
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