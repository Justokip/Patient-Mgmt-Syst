codeunit 50101 "WrkFlwResponseHndlng1"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Patient1: Record "Hosp Received Items";
        DocumentRelease1: Codeunit "Documentation Released1";
        Varvariant: variant;
    begin
        Varvariant := RecRef;
        case RecRef.number of
            DATABASE::"Hosp Received Items":
                begin
                    Patient1.SetView(RecRef.GetView());
                    Handled := true;
                    DocumentRelease1.HospitemsApproved(Varvariant);
                end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Patient1: Record "Hosp Received Items";
        DocumentRelease1: Codeunit "Documentation Released1";
        Varvariant: variant;

    begin
        Varvariant := RecRef;
        case RecRef.number of
            DATABASE::"Hosp Received Items":
                begin
                    Patient1.SetView(RecRef.GetView());
                    Handled := true;
                    DocumentRelease1.HospitemsApproved(Varvariant);
                end;
        end;
        case RecRef.number of
            DATABASE::"Hosp Received Items":
                begin
                    Patient1.SetView(RecRef.GetView());
                    Handled := true;
                    DocumentRelease1.HospitemsCanceled(Varvariant);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit::Codeunit, 1521, 'OnAddWorkFlowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkFlowResponseHandling: Codeunit "Workflow Response Handling";
        WorkFlowEventHandlingCust: Codeunit WorkFlowEvntHndlng1;
    begin
        //hosp received items
        case ResponseFunctionName of
            WorkFlowResponseHandling.SetStatusToPendingApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SetStatusToPendingApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendHospReceivedItemsForApprovalCode);

            WorkFlowResponseHandling.SendApprovalRequestforApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendHospReceivedItemsForApprovalCode);

            WorkFlowResponseHandling.CancelAllApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CancelAllApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnCancelHospReceivedItemsApprovalCode);

            WorkFlowResponseHandling.OpenDocumentCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.OpenDocumentCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnRejectedHospReceivedItemsApprovalCode);

            WorkFlowResponseHandling.CreateApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CreateApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendHospReceivedItemsForApprovalCode);

        end;

    end;

}