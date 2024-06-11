page 50133 "Items Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Items Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Lab Code"; Rec."Lab Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Code field.';
                }
                field("Test Type"; Rec."Test Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Test Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Available; Rec.Available)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available field.';
                }
            }
        }
    }
}