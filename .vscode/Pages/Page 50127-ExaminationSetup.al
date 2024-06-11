page 50127 "Examination Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Examination Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("exam code"; Rec."exam code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exam code field.';
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