page 50143 "Receipt List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Patient Receipt";
    CardPageId = "Patient Reciept";
    SourceTableView = where(Post = filter(false));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Receipt code"; Rec."Receipt code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Code field.';
                }
                field("Admission No"; Rec."Admission No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission No field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Receipt Amount"; Rec."Receipt Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Amount field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Date field.';
                }
            }
        }
    }
}


