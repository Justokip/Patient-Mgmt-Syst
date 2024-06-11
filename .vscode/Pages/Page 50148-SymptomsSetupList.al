page 50148 "Symptoms Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Symptoms Setup";
    CardPageId = "Symptoms Setup";
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Sym Code"; Rec."Sym Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Setup Code field.';
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