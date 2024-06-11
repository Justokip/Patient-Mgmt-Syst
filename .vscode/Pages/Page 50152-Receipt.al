page 50152 "Receipt Form"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Receipt Lns";
    CardPageId = "Receipt lns";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Rcpt Code"; Rec."Rcpt Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Code field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
            }
        }
    }
}