page 50124 "Labresults List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Lab Results";
    CardPageId = "Lab Results";
    Caption = 'Lab';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("LR Code"; Rec."LR Code")
                {
                    ApplicationArea = All;
                    Visible = false;
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
                    Visible = true;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Lab Status"; Rec."Lab Status")
                {
                    ApplicationArea = All;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Lab Status field.';
                }
                field("Lab Results"; Rec."Lab Results")
                {
                    ApplicationArea = All;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Lab Results field.';
                }


            }
        }
    }
}