pageextension 50102 Customertype extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Document Type")
        {

            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Type field.';
            }
        }
    }
}