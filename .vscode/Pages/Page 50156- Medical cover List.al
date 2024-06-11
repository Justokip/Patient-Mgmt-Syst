page 50156 "Medical cover List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Medical Cover";
    CardPageId = "Medical Cover";

    layout
    {
        area(Content)
        {
            repeater(lines)
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