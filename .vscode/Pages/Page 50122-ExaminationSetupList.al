page 50122 "Examination Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Examination Setup";
    
    layout
    {
        area(Content)
        {
            repeater(Genaral)
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