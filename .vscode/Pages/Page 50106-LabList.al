page 50106 "Lab List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableView = where(Status1 = filter(Laboratory), "Status From Lab" = filter(Open));
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
                field("Lab Results"; Rec."Lab Results")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lab Results field.';
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
    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
    begin
        usersetup.SetRange("User ID", UserId);
        if usersetup.FindFirst() then begin
            if usersetup.Laboratory = false then
                Error('Permission denied!!');
        end;
    end;

}