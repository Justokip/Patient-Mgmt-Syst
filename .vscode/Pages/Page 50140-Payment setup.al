page 50140 "Payment setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Payment Setup";

    layout
    {
        area(Content)
        {
            repeater(lines)
            {

                field("setup code"; Rec."setup code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Setup Code field.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Payment Number"; Rec."Payment Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Number field.';
                }
               
            }
        }
    }
}