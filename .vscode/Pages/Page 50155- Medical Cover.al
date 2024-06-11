page 50155 "Medical Cover"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Medical Cover";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
            }
        }
    }
}