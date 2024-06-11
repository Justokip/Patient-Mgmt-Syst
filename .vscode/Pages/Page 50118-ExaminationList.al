page 50118 "Examination List"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Examination;
    CardPageId = Examination;

    layout
    {
        area(Content)
        {
            repeater(lines)
            {
                field("Examination Code"; Rec."Examination Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Examination Code field.';
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
