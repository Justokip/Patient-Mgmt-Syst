page 50138 "Patient Reciept"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Patient Receipt";
    SourceTableView = where(Post = filter(false));

    layout
    {
        area(Content)
        {
            group(General)
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
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account field.';
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
                field(Post; Rec.Post)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            part(rcpt; "Receipt Form")
            {
                Visible = false;
                applicationarea = all;
                SubPageLink = "Rcpt Code" = field("Receipt code");
            }

        }
    }
    actions
    {
        area(navigation)
        {
            group(PostReceipt)
            {
                action(SendAp)
                {

                    ApplicationArea = All;
                    Caption = 'Post';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient receipt';
                    Visible = Rec.Post = false;


                    trigger OnAction()
                    begin
                        Postrcpt.Postedrcpt(Rec);
                        CurrPage.Close();
                    end;
                }
            }
        }
    }
    var
        Postrcpt: Codeunit "Finance Management1";
}