codeunit 50102 "Hosp Approval Mngmnt1"
{


    //check if hospital received items workflows is enabled
    //RECEIVED ITEMS
    procedure CheckHospReceivedItemsApprovalsWorkFlowEnable(var Patient1: Record "Hosp Received Items"): Boolean
    begin
        IF NOT IsHospReceivedItemsApprovalsWorkFlowEnable(Patient1) then
            Error(NoWorkFlowEnabledErr11);
        exit(true);
    end;

    procedure IsHospReceivedItemsApprovalsWorkFlowEnable(var patient1: Record "Hosp Received Items"): Boolean
    begin
        EXIT(WorkFlowManagement11.CanExecuteWorkflow(patient1, WorkFlowEventHandlingCust11.RunWorkFlowOnSendHospReceivedItemsForApprovalCode()));
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendHospReceivedItemsForApproval(Var patient1: Record "Hosp Received Items")
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelHospReceivedItemsForApproval(var patient1: Record "Hosp Received Items")
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var recref: RecordRef; var ApprovalEntryArgument: Record "Approval Entry")
    var
        patient1: Record "Hosp Received Items";
    begin
        case recref.Number of
            DATABASE::"Hosp Received Items":
                begin
                    recref.SetTable(patient1);
                    ApprovalEntryArgument."Document No." := patient1."Medicine Code";
                end;
        end;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        patient1: Record "Hosp Received Items";
    begin
        case RecRef.number of
            DATABASE::"Hosp Received Items":
                begin
                    RecRef.SetTable(patient1);
                    patient1."Status" := patient1."Status"::"Pending Approval";
                    Variant := patient1;
                    patient1.Modify(true);
                    IsHandled := true;
                end;
        end;
    end;

    var
        WorkFlowManagement11: Codeunit "Workflow Management";
        WorkFlowEventHandlingCust11: Codeunit WorkFlowEvntHndlng1;
        NoWorkFlowEnabledErr11: TextConst ENU = 'No Approval Workflow for this record type is enabled ';

}