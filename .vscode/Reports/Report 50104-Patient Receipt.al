report 50104 "Patient Receipt"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Patient Receipt Report';
    // RDLCLayout = 'Patient Receipt.rdl';
    RDLCLayout = 'Patient Receipt2.rdl';
    DefaultLayout = RDLC;


    dataset
    {
        dataitem("Patient Receipt"; "Patient Receipt")
        {
            RequestFilterFields = "Admission No";
            column(AdmissionNo_PatientReceipt; "Admission No")
            {
            }
            column(FullName_PatientReceipt; "Full Name")
            {
            }
            column(Receiptcode_PatientReceipt; "Receipt code")
            {
            }

            column(PaymentMethod_PatientReceipt; "Payment Method")
            {
            }
            column(PostingDate_PatientReceipt; "Posting Date")
            {
            }
            column(ReceiptDate_PatientReceipt; "Receipt Date")
            {
            }
            column(ReceiptAmount_PatientReceipt; "Receipt Amount")
            {
            }
            column(logo; CompInfo.Picture)
            {

            }
            column(CompanyName; CompInfo.Name)
            {

            }
            column(CompanyAddress; CompInfo.Address)
            {

            }

            dataitem("Receipt Lns"; "Receipt Lns")
            {
                DataItemLink = "Rcpt code" = field("Receipt Code");
                column(RcptCode_ReceiptLns; "Rcpt Code")
                {
                }
                column(Description_ReceiptLns; Description)
                {
                }
                column(Cost_ReceiptLns; Cost)
                {
                }
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture)
    end;

    var
        CompInfo: Record "Company Information";
}