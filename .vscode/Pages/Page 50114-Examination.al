page 50114 "Examination"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Examination;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Examination Code"; Rec."Examination Code")
                {
                    ApplicationArea = All;
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
