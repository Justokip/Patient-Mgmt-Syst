page 50142 "Charges List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Charges;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("Bal.Account Type"; Rec."Bal.Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal.Account Type field.';
                }
                field("Balancing Acc. No."; Rec."Balancing Acc. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balancing Acc. No. field.';
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
