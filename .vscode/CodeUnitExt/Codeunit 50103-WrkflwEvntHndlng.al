codeunit 50103 "WorkFlowEvntHndlng1"
{
    var
        //Hospital Received Items
        workflowevent: Codeunit "Workflow Event Handling";
        workflowmanagement: Codeunit "Workflow Management";
        HospReceivedItemsSendForApprovalEventDescTxt: Label 'An Hospital Item is  send for Approval';
        HospReceivedItemsCancelForApprovalEventDescTxt: Label 'An Hospital item is cancelled';
        HospReceivedItemsReleasedText: Label 'An Hospital item Is Approved';
        HospReceivedItemsSendForRejectedEventDescTxt: Label 'An Hospital item is  rejected';

    // Hosp received items Procedures
    procedure RunWorkFlowOnSendHospReceivedItemsForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnSendHospReceivedItemsForApproval'))
    end;

    procedure RunWorkFlowOnCancelHospReceivedItemsApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnCancelHospReceivedItemsApproval'));
    end;

    procedure RunWorkFlowOnReleaseHospReceivedItemsCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnReleaseHospReceivedItemsApproval'));
    end;

    procedure RunWorkFlowOnRejectedHospReceivedItemsApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnRejectedHospReceivedItemsApproval'));
    end;

    //Adding Events To library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowEventsToLibrary()
    begin
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnSendHospReceivedItemsForApprovalCode, Database::"Hosp Received Items", HospReceivedItemsSendForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnCancelHospReceivedItemsApprovalCode, Database::"Hosp Received Items", HospReceivedItemsCancelForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnReleaseHospReceivedItemsCode, Database::"Hosp Received Items", HospReceivedItemsReleasedText, 0, false);
        workflowevent.AddEventToLibrary(RunWorkFlowOnRejectedHospReceivedItemsApprovalCode, Database::"Hosp Received Items", HospReceivedItemsSendForRejectedEventDescTxt, 0, false);

    end;


    //Adding Predecessors to library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        //hosp received items
        case EventFunctionName of
            RunWorkFlowOnCancelHospReceivedItemsApprovalCode:
                WorkFlowEvent.AddEventPredecessor(RunWorkFlowOnCancelHospReceivedItemsApprovalCode, RunWorkFlowOnSendHospReceivedItemsForApprovalCode);

            RunWorkFlowOnRejectedHospReceivedItemsApprovalCode:
                workflowevent.AddEventPredecessor(RunWorkFlowOnRejectedHospReceivedItemsApprovalCode, RunWorkFlowOnSendHospReceivedItemsForApprovalCode);

            WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode, RunWorkFlowOnSendHospReceivedItemsForApprovalCode)
                end;
            WorkFlowEvent.RunWorkflowOnDelegateApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnDelegateApprovalRequestCode, RunWorkFlowOnSendHospReceivedItemsForApprovalCode)
                end;

        end;
    end;

    //Events Subscribers
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Hosp Approval Mngmnt1", 'OnSendHospReceivedItemsForApproval', '', true, true)]
    local procedure RunWorkFlowOnSendHospReceivedItemsForApproval(var Patient1: Record "Hosp Received Items")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnSendHospReceivedItemsForApprovalCode, Patient1);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Hosp Approval Mngmnt1", 'OnCancelHospReceivedItemsForApproval', '', true, true)]
    local procedure RunWorkFlowOnCancelHospReceivedItemsForApproval(var Patient1: Record "Hosp Received Items")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnCancelHospReceivedItemsApprovalCode, Patient1);
    end;


}

