page 50157 "Posted Patient Invoice"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Patient Invoice";
    SourceTableView = where(Post = filter(true));
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {


                field("Entry Code"; Rec."Entry Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Code field.';
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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Invoiced Amount"; Rec."Invoiced Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced Amount field.';
                }
                field(Post; Rec.Post)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }

            }
            part(Invc; "Invoice Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Invoice Code" = field("Entry Code");
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(PostInvoice)
            {
                action(SendAp)
                {

                    ApplicationArea = All;
                    Caption = 'Post';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Invoice';

                    trigger OnAction()
                    begin
                        Postinvc.PostedInvoice(Rec);
                    end;
                }
            }
        }
    }
    var
        Postinvc: Codeunit "Finance Management1";


}


