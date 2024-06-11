pageextension 50100 Medicine extends "Item Card"
{
    layout
    {
        addafter(Description)
        {

            field("Medicine Type"; Rec."Medicine Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Medicine Type field.';
            }
            field("Receive Date"; Rec."Receive Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Receive Date field.';
            }
            field("Serial Number"; Rec."Serial Number")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Serial Nember field.';
            }
            field("Manufacturing Date"; Rec."Manufacturing Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manufacturing Date field.';
            }
            field("Expiry Date"; Rec."Expiry Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Expiry Date field.';
            }
        }
    }
}