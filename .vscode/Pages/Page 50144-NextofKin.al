page 50144 "Next of Kin"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Next of Kin";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                
                field("Kin Code"; Rec."Kin Code")
                {
                    ApplicationArea = All;
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