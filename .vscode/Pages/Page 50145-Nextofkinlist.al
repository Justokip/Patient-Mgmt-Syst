page 50145 "Next of Kin List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Next of Kin";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Kin Code"; Rec."Kin Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Kin Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Phone Numuber"; Rec."Phone Numuber")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("ID/Passport Number"; Rec."ID/Passport Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID/Passport Number field.';
                }
            }
        }
    }
}