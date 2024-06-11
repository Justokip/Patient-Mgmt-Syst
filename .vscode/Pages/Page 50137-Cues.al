page 50137 "CuesGrp"
{
    PageType = CardPart;
    ApplicationArea = suite;
    UsageCategory = Administration;
    SourceTable = CuesGrp;
    Caption = 'JUSTUS HEALTHCARE';

    layout
    {
        area(Content)
        {
            cuegroup(Departments)
            {

                field(Triage; Rec.Triage)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Triage field.';
                    DrillDownPageId = "Triage List";
                }
                field(Doctor; Rec.Doctor)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Doctor field.';
                    DrillDownPageId = "Doctor List";
                }
                field(Lab; Rec.Lab)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Laboratory field.';
                    DrillDownPageId = "Lab List";
                }
                field(Labresults; Rec.Labresults)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Lab Results field.';
                    DrillDownPageId = "Lab Rls List";
                }
                field(Pharmacy; Rec.Pharmacy)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Pharmacy field.';
                    DrillDownPageId = "Patients List";
                }
                field(Discharged; Rec.Discharged)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Discharged field.';
                    DrillDownPageId = "Discharged Patients";
                }
            }
            cuegroup(Invoices)
            {
                field("Patient Invoice"; Rec."Patient Invoice")
                {
                    ApplicationArea = Basic, suite;
                    ToolTip = 'Specifies the value of the Invoices field.';
                    DrillDownPageId = "Patient Invoice List";
                }
                field("Posted invoice"; Rec."Posted invoice")
                {
                    ApplicationArea = Basic, suite;
                    ToolTip = 'Specifies the value of the Posted Invoice field.';
                    DrillDownPageId = "Posted Invoice List";
                }
            }
            cuegroup(Receipts)
            {
                field("Patient Receipt"; Rec."Patient Receipt")
                {
                    ApplicationArea = Basic, suite;
                    ToolTip = 'Specifies the value of the Receipts field.';
                    DrillDownPageId = "Receipt List";
                }
                field("Posted Receipts"; Rec."Posted Receipts")
                {
                    ApplicationArea = Basic, suite;
                    ToolTip = 'Specifies the value of the Posted Receipts field.';
                    DrillDownPageId = "Posted Receipt List";
                }
            }

            cuegroup(Approvals)
            {
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Approved Status field.';
                    DrillDownPageId = "Approval Entries";
                }
                field("Canceled Approvals"; Rec."Canceled Approvals")
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Canceled Approvals field.';
                    DrillDownPageId = "Approval Entries";
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                    ApplicationArea = suite;
                    ToolTip = 'Specifies the value of the Items field.';
                    DrillDownPageId = "Pending Approval FactBox";
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Usersetup: Record "User Setup";
    begin
        if not Rec.Get then begin
            Rec.Init();
            REC.Insert();
        end;
        REC.SetRange("User ID Filter", UserId);
    end;
}