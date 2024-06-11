page 50123 "Lab Results"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Lab Results";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("LR Code"; Rec."LR Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LR Code field.';
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
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Lab Status"; Rec."Lab Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Status field.';
                }
                field("Lab Results"; Rec."Lab Results")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Results field.';
                }


            }
        }
    }
}