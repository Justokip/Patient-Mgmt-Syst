page 50101 "Hospital Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Hospital Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Minimum year of birth"; Rec."Minimum year of birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Year of Birth field.';
                }
                // field("Consultation Fee"; Rec."Consultation Fee")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Consultation Fee field.';
                // }
            }
            group("Number Series")
            {
                field("Admission No"; Rec."Admission No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission No field.';

                }
                field("Entry Code"; Rec."Entry Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the entry code field.';
                }
                field("Lab Code"; Rec."Lab Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Code field.';
                }
                field("Medicine Code"; Rec."Medicine Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medicine Code field.';
                }
                field("Medical fee code"; Rec."Medical fee code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Charges Code field.';
                }
                field("Primary Keys"; Rec."Primary Keys")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Keys field.';
                }
                field("setup code"; Rec."setup code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Setup Code field.';
                }
                field("Receipt code"; Rec."Receipt code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Code field.';
                }
                field("Sym Code"; Rec."Sym Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Symptoms Code field.';

                }
                field("Diag Code"; Rec."Diag Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diagnosis Code field.';

                }
                field("exam code"; Rec."exam code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exam code field.';
                }
                field("Fee Code"; Rec."Fee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Code field.';
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
            }
            group(Journals)
            {
                field("General Journal Template"; Rec."General Journal Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Journal Template field.';
                }
                field("General Journal Batch"; Rec."General Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Journal Batch field.';
                }
                field("Item Journal Template"; Rec."Item Journal Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Journal Template field.';
                }
                field("Item Journal Batch"; Rec."Item Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Journal Batch field.';
                }

            }
            group("G/L Accounts")
            {
                field("Invoicing GL Account"; Rec."Invoicing GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoicing GL Account field.';
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
            }
            group("Posting Groups")
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Post. Group field.';
                }
            }
            group("Bank Details")
            {
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Receiving Bank Account"; Rec."Receiving Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Bank Account field.';
                }
                field("Receiving Bank Account No."; Rec."Receiving Bank Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Bank Account No. field.';
                }
                field("Minimum Payment"; Rec."Minimum Payment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Payment field.';
                }
            }
        }
    }
}
