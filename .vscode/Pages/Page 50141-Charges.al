page 50141 "Charges "
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Charges;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Medical fee code"; Rec."Medical fee code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Fee Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Name field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Type field.';
                }
                field("Balancing Acc. No."; Rec."Balancing Acc. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balancing Acc. No. field.';
                }
                field("Bal.Account Type"; Rec."Bal.Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal.Account Type field.';
                }
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S/NUMBER field.';
                }
                field("Amount Sum"; Rec."Amount Sum")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Sum field.';
                }
            }
        }
    }
}