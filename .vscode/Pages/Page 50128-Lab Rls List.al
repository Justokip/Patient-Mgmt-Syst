page 50128 "Lab Rls List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableView = where("Status From Lab" = filter("Back to Doctor"), Status1 = filter(Laboratory));
    CardPageId = "Patient Form";
    Editable = false;
    Caption = 'Lab Rls List';

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Admission No"; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission No field.';
                }
                field("Full Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Gender; Rec.Gender1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Age; Rec.Age1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Status; Rec.Status1)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}