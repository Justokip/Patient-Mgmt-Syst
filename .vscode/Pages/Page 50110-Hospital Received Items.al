page 50110 "Hosp Received Items"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Hosp Received Items";
    layout
    {
        area(Content)
        {
            group(General)
            {

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quatity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quatity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Unit of Measure field.';
                }
                field("Manufacturing company"; Rec."Manufacturing company")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Manufacturing Company field.';
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
                field("Receive Date"; Rec."Receive Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receive Date field.';
                }
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serial Number field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Post; Rec.Post)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }

            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Approvals)
            {
                Caption = 'Actions';
                action(SendApp)
                {

                    ApplicationArea = All;
                    Caption = 'Send For Approval';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Item Form';


                    trigger OnAction()
                    begin
                        IF ApprovalMgt.CheckHospReceivedItemsApprovalsWorkFlowEnable(Rec) THEN
                            ApprovalMgt.OnSendHospReceivedItemsForApproval(Rec);

                    end;
                }
                action(cancelApp)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel For Approval';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Item Form';


                    trigger OnAction()
                    begin
                        IF ApprovalMgt.CheckHospReceivedItemsApprovalsWorkFlowEnable(Rec) THEN
                            ApprovalMgt.OnCancelHospReceivedItemsForApproval(Rec);
                    end;
                }
                action(App)
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Item Form';
                    trigger OnAction()
                    var
                    begin
                        itemposting.ItemsPosting(Rec);
                    end;
                }
            }
        }

    }


    trigger OnAfterGetRecord()
    begin
        OpenApprovalEntriesExistForCurrUser := ApproveMagt.HasOpenApprovalEntriesForCurrentUser(Rec.RECORDID);
        OpenApprovalEntriesExist := ApproveMagt.HasOpenApprovalEntries(Rec.RECORDID);
        CanCancelApprovalForRecord := ApproveMagt.CanCancelApprovalForRecord(Rec.RECORDID);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RECORDID, CanSendApprovalForFlow, CanCancelApprovalForFlow);
    end;

    var
        ApprovalMgt: Codeunit "Hosp Approval Mngmnt1";
        ApprrovalMgtCut: Codeunit "Hosp Approval Mngmnt1";
        WorkFlowWebhookMgt: codeunit "Workflow Webhook Management";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanCancelApprovalForFlow: Boolean;
        CanSendApprovalForFlow: Boolean;
        ApproveMagt: Codeunit "Approvals Mgmt.";
        itemposting: Codeunit "Items Management";



}