page 50129 "Items"
{
    Caption = 'Medicine';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Item,History,Prices & Discounts,Approve,Request Approval';
    RefreshOnActivate = true;
    SourceTable = item;

    AboutTitle = 'About item details';
    AboutText = 'With the Item Card you manage the information that appears in sales and purchase documents when you buy or sell an item, such as line description and price. You can also find settings for how an item is priced, replenished, stocked, and for how costing and posting is done.';

    layout
    {
        area(content)
        {
            group(Item)
            {
                Caption = 'Item';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
                    Importance = Standard;
                }
                field("Medicine Code"; Rec."Medicine Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Code field.';
                }
                field("Medicine Type"; Rec."Medicine Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the item card represents a physical inventory unit (Inventory), a labor time unit (Service), or a physical unit that is not tracked in inventory (Non-Inventory).';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic, Suite, Invoicing;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the base unit used to measure the item, such as piece, box, or pallet. The base unit of measure also serves as the conversion basis for alternate units of measure.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies when the item card was last modified.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the category that the item belongs to. Item categories also contain any assigned item attributes.';
                }
                field("Common Item No."; rec."Common Item No.")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies the unique common item number that the intercompany partners agree upon.';
                }
                field("Purchasing Code"; rec."Purchasing Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for a special procurement method, such as drop shipment.';
                }
            }
            group(InventoryGrp)
            {
                Caption = 'Inventory';
                // Visible = IsInventoriable;
                AboutTitle = 'For items on inventory';
                AboutText = 'Here are settings and information for an item that is kept on inventory. See or update the available inventory, current orders, physical volume and weight, and settings for low inventory handling.';

                field("Shelf No."; rec."Shelf No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies where to find the item in the warehouse. This is informational only.';
                }
                field("Created From Nonstock Item"; rec."Created From Nonstock Item")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that the item was created from a catalog item.';
                }
                field(Inventory; rec.Inventory)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory.';

                }

                field("Qty. on Assembly Order"; rec."Qty. on Assembly Order")
                {
                    ApplicationArea = Assembly;
                    Importance = Additional;
                    ToolTip = 'Specifies how many units of the item are allocated to assembly orders, which is how many are listed on outstanding assembly order headers.';
                }
                field(StockoutWarningDefaultYes; rec."Stockout Warning")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stockout Warning';
                    ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero.';
                }
                field(StockoutWarningDefaultNo; rec."Stockout Warning")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stockout Warning';
                    OptionCaption = 'Default (No),No,Yes';
                    ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero.';
                }
                field(PreventNegInventoryDefaultYes; rec."Prevent Negative Inventory")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Prevent Negative Inventory';
                    Importance = Additional;
                    OptionCaption = 'Default (Yes),No,Yes';
                    ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
                }
                field(PreventNegInventoryDefaultNo; rec."Prevent Negative Inventory")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Prevent Negative Inventory';
                    Importance = Additional;
                    OptionCaption = 'Default (No),No,Yes';
                    ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
                }
                field("Net Weight"; rec."Net Weight")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the net weight of the item.';
                }
                field("Gross Weight"; rec."Gross Weight")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the gross weight of the item.';
                }
                field("Unit Volume"; rec."Unit Volume")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the volume of one unit of the item.';
                }
                field("Over-Receipt Code"; rec."Over-Receipt Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the policy that will be used for the item if more items than ordered are received.';
                }
                field("Trans. Ord. Receipt (Qty.)"; rec."Trans. Ord. Receipt (Qty.)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity of the items that remains to be received but are not yet shipped as the difference between the Quantity and the Quantity Shipped fields.';
                    Visible = false;
                }
                field("Trans. Ord. Shipment (Qty.)"; rec."Trans. Ord. Shipment (Qty.)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity of the items that remains to be shipped as the difference between the Quantity and the Quantity Shipped fields.';
                    Visible = false;
                }
                field("Qty. in Transit"; rec."Qty. in Transit")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the quantity of the items that are currently in transit.';
                    Visible = false;
                }
            }
            group("Cost Details")
            {
                Caption = 'Cost Details';
                field("Costing Method"; rec."Costing Method")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how the item''s cost flow is recorded and whether an actual or budgeted value is capitalized and used in the cost calculation.';
                }
                field("Standard Cost"; rec."Standard Cost")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the unit cost that is used as an estimation to be adjusted with variances later. It is typically used in assembly and production where costs can vary.';

                    trigger OnDrillDown()
                    var
                        ShowAvgCalcItem: Codeunit "Show Avg. Calc. - Item";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Unit Cost"; rec."Unit Cost")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';

                    trigger OnDrillDown()
                    var
                        ShowAvgCalcItem: Codeunit "Show Avg. Calc. - Item";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Indirect Cost %"; rec."Indirect Cost %")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                }
                field("Last Direct Cost"; rec."Last Direct Cost")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the most recent direct unit cost of the item.';
                }
                field("Net Invoiced Qty."; rec."Net Invoiced Qty.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how many units of the item in inventory have been invoiced.';
                }
                field("Cost is Adjusted"; rec."Cost is Adjusted")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether the item''s unit cost has been adjusted, either automatically or manually.';
                }
                field("Cost is Posted to G/L"; rec."Cost is Posted to G/L")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that all the inventory costs for this item have been posted to the general ledger.';
                }
            }
            group("Posting Details")
            {
                Caption = 'Posting Details';
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Tax Group Code"; rec."Tax Group Code")
                {
                    ApplicationArea = SalesTax;
                    Importance = Promoted;
                    ToolTip = 'Specifies the tax group that is used to calculate and post sales tax.';
                }
                field("Inventory Posting Group"; rec."Inventory Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
                }
                field("Default Deferral Template Code"; REC."Default Deferral Template Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Default Deferral Template';
                    ToolTip = 'Specifies how revenue or expenses for the item are deferred to other accounting periods by default.';
                }
            }
            group(ForeignTrade)
            {
                Caption = 'Foreign Trade';
                field("Tariff No."; rec."Tariff No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a code for the item''s tariff number.';
                }
                field("Country/Region of Origin Code"; rec."Country/Region of Origin Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies a code for the country/region where the item was produced or processed.';
                }
            }

            group("Prices & Sales")
            {
                Caption = 'Prices & Sales';
                AboutTitle = 'Track prices and profits';
                AboutText = 'Specify a basic price and the related profit for this item, and define special prices and discounts to certain customers. In either case, the prices defined here can be overridden at the time a document is posted.';

                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = Basic, Suite, Invoicing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(CalcUnitPriceExclVAT; rec.CalcUnitPriceExclVAT)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the unit price excluding VAT.';
                }
                field("Price Includes VAT"; rec."Price Includes VAT")
                {
                    ApplicationArea = VAT;
                    Importance = Additional;
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales document lines for this item should be shown with or without VAT.';

                    trigger OnValidate()
                    begin
                        if rec."Price Includes VAT" = xRec."Price Includes VAT" then
                            exit;
                    end;
                }
                field("Price/Profit Calculation"; rec."Price/Profit Calculation")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the relationship between the Unit Cost, Unit Price, and Profit Percentage fields associated with this item.';


                }
                field("Profit %"; rec."Profit %")
                {
                    ApplicationArea = Basic, Suite;
                    DecimalPlaces = 2 : 2;
                    ToolTip = 'Specifies the profit margin that you want to sell the item at. You can enter a profit percentage manually or have it entered according to the Price/Profit Calculation field';
                }
                field("Allow Invoice Disc."; rec."Allow Invoice Disc.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies if the item should be included in the calculation of an invoice discount on documents where the item is traded.';
                }
                field("Item Disc. Group"; rec."Item Disc. Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies an item group code that can be used as a criterion to grant a discount when the item is sold to a certain customer.';
                }
                field("Sales Unit of Measure"; rec."Sales Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the unit of measure code used when you sell the item.';
                }
                field("Sales Blocked"; rec."Sales Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the item cannot be entered on sales documents, except return orders and credit memos, and journals.';
                }
                field("Application Wksh. User ID"; rec."Application Wksh. User ID")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the ID of a user who is working in the Application Worksheet window.';
                    Visible = false;
                }
                field("VAT Bus. Posting Gr. (Price)"; rec."VAT Bus. Posting Gr. (Price)")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the VAT business posting group for customers for whom you want the sales price including VAT to apply.';
                }
                field("Lead Time Calculation"; rec."Lead Time Calculation")
                {
                    ApplicationArea = Assembly, Planning;
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
            }

            group(Purchase)
            {
                Caption = 'Purchase';
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the vendor code of who supplies this item by default.';
                }
                field("Vendor Item No."; rec."Vendor Item No.")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                }
                field("Purch. Unit of Measure"; rec."Purch. Unit of Measure")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the unit of measure code used when you purchase the item.';
                }
                field("Purchasing Blocked"; rec."Purchasing Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the item cannot be entered on purchase documents, except return orders and credit memos, and journals.';
                }
            }
            group(Replenishment_Production)
            {
                Caption = 'Production';
                field("Manufacturing Policy"; rec."Manufacturing Policy")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies if additional orders for any related components are calculated.';
                }
                field("Routing No."; rec."Routing No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the production routing that the item is used in.';
                }
                field("Production BOM No."; rec."Production BOM No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the production BOM that the item represents.';
                }
                field("Rounding Precision"; rec."Rounding Precision")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how calculated consumption quantities are rounded when entered on consumption journal lines.';
                }
                field("Flushing Method"; rec."Flushing Method")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                }
                field("Overhead Rate"; rec."Overhead Rate")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Additional;
                    ToolTip = 'Specifies the item''s indirect cost as an absolute amount.';
                }
                field("Scrap %"; rec."Scrap %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                }
                field("Lot Size"; rec."Lot Size")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the default number of units of the item that are processed in one production operation. This affects standard cost calculations and capacity planning. If the item routing includes fixed costs such as setup time, the value in this field is used to calculate the standard cost and distribute the setup costs. During demand planning, this value is used together with the value in the Default Dampener % field to ignore negligible changes in demand and avoid re-planning. Note that if you leave the field blank, it will be threated as 1.';
                }
            }
            group(Replenishment_Assembly)
            {
                Caption = 'Assembly';
                field("Assembly Policy"; rec."Assembly Policy")
                {
                    ApplicationArea = Assembly;
                    ToolTip = 'Specifies which default order flow is used to supply this assembly item.';
                }
                field(AssemblyBOM; rec."Assembly BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = Assembly;
                    ToolTip = 'Specifies if the item is an assembly BOM.';

                    trigger OnDrillDown()
                    var
                        BOMComponent: Record "BOM Component";
                    begin
                        Commit();
                        PAGE.Run(PAGE::"Assembly BOM", BOMComponent);
                        CurrPage.Update();
                    end;
                }
            }

            group(OrderModifiers)
            {
                Caption = 'Order Modifiers';
                field("Minimum Order Quantity"; rec."Minimum Order Quantity")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies a minimum allowable quantity for an item order proposal.';
                }
                field("Maximum Order Quantity"; rec."Maximum Order Quantity")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies a maximum allowable quantity for an item order proposal.';
                }
                field("Order Multiple"; rec."Order Multiple")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies a parameter used by the planning system to modify the quantity of planned supply orders.';
                }

            }

            group(ItemTracking)
            {
                Caption = 'Item Tracking';
                field("Item Tracking Code"; rec."Item Tracking Code")
                {
                    ApplicationArea = ItemTracking;
                    Importance = Promoted;
                    ToolTip = 'Specifies how serial or lot numbers assigned to the item are tracked in the supply chain.';

                    trigger OnValidate()
                    begin
                    end;
                }
                field("Serial Nos."; rec."Serial Nos.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies a number series code to assign consecutive serial numbers to items produced.';
                }
                field("Lot Nos."; rec."Lot Nos.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies the number series code that will be used when assigning lot numbers.';
                }
                field("Expiration Calculation"; rec."Expiration Calculation")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies the date formula for calculating the expiration date on the item tracking line. Note: This field will be ignored if the involved item has Require Expiration Date Entry set to Yes on the Item Tracking Code page.';

                    trigger OnValidate()
                    begin
                    end;
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                field("Warehouse Class Code"; rec."Warehouse Class Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the warehouse class code for the item.';
                }
                field("Special Equipment Code"; rec."Special Equipment Code")
                {
                    ApplicationArea = Warehouse;
                    Importance = Additional;
                    ToolTip = 'Specifies the code of the equipment that warehouse employees must use when handling the item.';
                }
                field("Put-away Template Code"; rec."Put-away Template Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the code of the put-away template by which the program determines the most appropriate zone and bin for storage of the item after receipt.';
                }
                field("Put-away Unit of Measure Code"; rec."Put-away Unit of Measure Code")
                {
                    ApplicationArea = Warehouse;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the item unit of measure in which the program will put the item away.';
                }
                field("Phys Invt Counting Period Code"; rec."Phys Invt Counting Period Code")
                {
                    ApplicationArea = Warehouse;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the counting period that indicates how often you want to count the item in a physical inventory.';
                }
                field("Last Phys. Invt. Date"; rec."Last Phys. Invt. Date")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the date on which you last posted the results of a physical inventory for the item to the item ledger.';
                }
                field("Last Counting Period Update"; rec."Last Counting Period Update")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the last date on which you calculated the counting period. It is updated when you use the function Calculate Counting Period.';
                }
                field("Next Counting Start Date"; rec."Next Counting Start Date")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the starting date of the next counting period.';
                }
                field("Next Counting End Date"; rec."Next Counting End Date")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the ending date of the next counting period.';
                }
                field("Identifier Code"; rec."Identifier Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies a unique code for the item in terms that are useful for automatic data capture.';
                }
                field("Use Cross-Docking"; rec."Use Cross-Docking")
                {
                    ApplicationArea = Warehouse;
                    Importance = Additional;
                    ToolTip = 'Specifies if this item can be cross-docked.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Variant Filter" = FIELD("Variant Filter");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(27),
                              "No." = FIELD("No.");
            }
            part(ItemAttributesFactbox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
            }
            // part(Control132; "Social Listening FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = CONST(Item),
            //                   "Source No." = FIELD("No.");
            //     Visible = false;
            //     ObsoleteState = Pending;
            //     ObsoleteReason = 'Microsoft Social Engagement has been discontinued.';
            //     ObsoleteTag = '17.0';
            // }
            // part(Control134; "Social Listening Setup FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = CONST(Item),
            //                   "Source No." = FIELD("No.");
            //     UpdatePropagation = Both;
            //     Visible = false;
            //     ObsoleteState = Pending;
            //     ObsoleteReason = 'Microsoft Social Engagement has been discontinued.';
            //     ObsoleteTag = '17.0';
            // }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ItemActionGroup)
            {
                Caption = 'Item';
                Image = DataEntry;
                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attributes';
                    Image = Category;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or edit the item''s attributes, such as color, size, or other characteristics that help to describe the item.';
                }
                action(AdjustInventory)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Adjust Inventory';
                    Image = InventoryCalculation;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Increase or decrease the item''s inventory quantity manually by entering a new quantity. Adjusting the inventory quantity manually may be relevant after a physical count or if you do not record purchased quantities.';

                }
                action("Va&riants")
                {
                    ApplicationArea = Planning;
                    Caption = 'Va&riants';
                    Image = ItemVariant;
                }

            }
            group(PricesandDiscounts)
            {
                Caption = 'Sales Prices & Discounts';
#if not CLEAN19
                action("Set Special Prices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Prices';
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Set up sales prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';

                    trigger OnAction()
                    var
                        SalesPrice: Record "Sales Price";
                    begin
                    end;
                }
                action("Set Special Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Discounts';
                    Image = LineDiscount;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Set up sales discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';

                    trigger OnAction()
                    var
                        SalesLineDiscount: Record "Sales Line Discount";
                    begin
                        SalesLineDiscount.SetCurrentKey(Type, Code);
                        SalesLineDiscount.SetRange(Type, SalesLineDiscount.Type::Item);
                    end;
                }
                action(PricesDiscountsOverview)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Prices & Discounts Overview';
                    Image = PriceWorksheet;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'View the sales prices and line discounts that you grant for this item when certain criteria are met, such as vendor, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';


                }
#endif
                action(SalesPriceLists)
                {
                    AccessByPermission = TableData "Sales Price Access" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Prices';
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Set up sales prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        AmountType: Enum "Price Amount Type";
                        PriceType: Enum "Price Type";
                    begin
                        Rec.ShowPriceListLines(PriceType::Sale, AmountType::Price);
                    end;
                }
                action(SalesPriceListsDiscounts)
                {
                    AccessByPermission = TableData "Sales Discount Access" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Discounts';
                    Image = LineDiscount;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Set up sales discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        AmountType: Enum "Price Amount Type";
                        PriceType: Enum "Price Type";
                    begin
                        Rec.ShowPriceListLines(PriceType::Sale, AmountType::Discount);
                    end;
                }
            }
            group(PurchPricesandDiscounts)
            {
                Caption = 'Purchase Prices & Discounts';
#if not CLEAN19

            }
            action(PurchPricesDiscountsOverview)
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Prices & Discounts Overview';
                Image = PriceWorksheet;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'View the purchase prices and line discounts that you grant for this item when certain criteria are met, such as vendor, quantity, or ending date.';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '17.0';
            }
#endif
            action(PurchPriceLists)
            {
                AccessByPermission = TableData "Purchase Price Access" = R;
                ApplicationArea = Suite;
                Caption = 'Purchase Prices';
                Image = Price;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Set up purchase prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
            }
            action(PurchPriceListsDiscounts)
            {
                AccessByPermission = TableData "Purchase Discount Access" = R;
                ApplicationArea = Suite;
                Caption = 'Purchase Discounts';
                Image = LineDiscount;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Set up purchase discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';

                trigger OnAction()
                var
                    AmountType: Enum "Price Amount Type";
                    PriceType: Enum "Price Type";
                begin
                    Rec.ShowPriceListLines(PriceType::Purchase, AmountType::Discount);
                end;
            }







            group(Flow)
            {
                Caption = 'Power Automate';
                action(CreateFlow)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create a flow';
                    Image = Flow;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedOnly = true;
                    ToolTip = 'Create a new flow in Power Automate from a list of relevant flow templates.';



                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Approval Workflow';
                    Image = CreateWorkflow;
                    ToolTip = 'Set up an approval workflow for creating or changing items, by going through a few pages that will guide you.';
                }
                action(ManageApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    Caption = 'Manage Approval Workflow';
                    Image = WorkflowSetup;
                    ToolTip = 'View or edit existing approval workflows for creating or changing items.';


                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    AccessByPermission = TableData "Stockkeeping Unit" = R;
                    ApplicationArea = Warehouse;
                    Caption = '&Create Stockkeeping Unit';
                    Image = CreateSKU;
                    ToolTip = 'Create an instance of the item at each location that is set up.';


                }
            }
            action("Requisition Worksheet")
            {
                ApplicationArea = Planning;
                Caption = 'Requisition Worksheet';
                Image = Worksheet;
            }
            action("Item Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Item Reclassification Journal")
            {
                ApplicationArea = Warehouse;
                Caption = 'Item Reclassification Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Item Tracing")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Tracing';
                Image = ItemTracing;
            }

            action("Unit Group")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Unit Group';
                Image = UnitOfMeasure;
            }
            group(Availability)
            {
                Caption = 'Availability';
                Image = ItemAvailability;
                action(ItemsByLocation)
                {
                    AccessByPermission = TableData Location = R;
                    ApplicationArea = Location;
                    Caption = 'Items b&y Location';
                    Image = ItemAvailbyLoc;
                    ToolTip = 'Show a list of items grouped by location.';

                    trigger OnAction()
                    begin
                    end;
                }
                group(ItemAvailabilityBy)
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action("<Action110>")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'View how the actual and the projected available balance of an item will develop over time according to supply and demand events.';

                        trigger OnAction()
                        begin

                        end;
                    }
                }
            }
        }
    }
    var
        item: Record Item;
}