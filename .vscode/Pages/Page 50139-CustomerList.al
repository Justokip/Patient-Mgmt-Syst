page 50139 "Customer Lst"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableView = where(Status1 = filter(Open));
    CardPageId = "Patient form";
    Editable = false;
    Caption = 'Patient Admission List';

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
                field(Status1; Rec.Status1)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        Usersetup: Record "User Setup";
    begin
        Usersetup.SetRange("User ID", UserId);
        if Usersetup.FindFirst() then begin
            if Usersetup.Reception = false then
                Error('No Permission');
        end;
    end;
}