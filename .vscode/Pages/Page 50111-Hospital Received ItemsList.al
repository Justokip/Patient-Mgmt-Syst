page 50111 "Hospital Received Items List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Hosp Received Items";
    CardPageId = "Hosp Received Items";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Medicine Code"; Rec."Medicine Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Code field.';
                }
                field("Medicine Type"; Rec."Medicine Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quatity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quatity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Receive Date"; Rec."Receive Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receive Date field.';
                }
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serial Number field.';
                }

            }
        }
    }
}