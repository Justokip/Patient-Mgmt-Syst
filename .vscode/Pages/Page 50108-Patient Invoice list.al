page 50108 "Patient Invoice List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Patient Invoice";
    CardPageId = "Patient Invoice";
    SourceTableView = where(Post = filter(false));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Date field.';
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

        }
    }
    trigger OnOpenPage()
    var

        usersetup: Record "User Setup";
    begin
        usersetup.SetRange("User ID", UserId);
        if usersetup.FindFirst() then begin
            if usersetup.Finance = false then
                Error('Permission denied!!');
        end;
    end;
}