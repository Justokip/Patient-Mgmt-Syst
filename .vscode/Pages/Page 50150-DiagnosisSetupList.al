page 50150 "Diagnosis Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Diagnosis Setup";
    
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Diag Code"; Rec."Diag Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diag Code field.';
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