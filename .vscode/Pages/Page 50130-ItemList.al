page 50130 "List of Items"
{
    Caption = 'List of Items';
    PageType = list;
    CardPageID = "item Card";
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices & Discounts,Navigate,Customer';
    RefreshOnActivate = true;
    SourceTable = Item;
    UsageCategory = Lists;
    ApplicationArea = All;
    AboutTitle = 'About customer details';
    AboutText = 'With the Customer Card you manage information about a customer and specify the terms of business, such as payment terms, prices and discounts. From here you can also drill down on past and ongoing sales activity.';
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the item.';
                }
                field("Medicine Type"; Rec."Medicine Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Type field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the base unit used to measure the item, such as piece, box, or pallet. The base unit of measure also serves as the conversion basis for alternate units of measure.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
            }
        }
    }
}