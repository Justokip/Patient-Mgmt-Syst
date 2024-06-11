page 50126 "Diagnosis List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Diagnosis;
    CardPageId = Diagnosis;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Diagnosis Code"; Rec."Diagnosis Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Diagnosis Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    TableRelation = "Diagnosis Setup";
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}