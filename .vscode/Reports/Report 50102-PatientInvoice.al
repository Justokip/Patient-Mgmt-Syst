report 50102 "Patient Invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Patient Invoice Report';
    RDLCLayout = 'Patient Invce Report.rdl';
    DefaultLayout = RDLC;



    dataset
    {
        dataitem("Patient Invoice"; "Patient Invoice")
        {
            RequestFilterFields = "Admission No";
            column(Admission_No; "Admission No")
            {

            }
            column(Full_Name; "Full Name")
            {

            }
            column(EntryCode_PatientInvoice; "Entry Code")
            {
            }
            column(DueDate_PatientInvoice; "Due Date")
            {
            }
            column(InvoiceDate_PatientInvoice; "Invoice Date")
            {
            }
            column(TotalAmount_PatientInvoice; "Invoiced Amount")
            {
            }
            column(PostingDate_PatientInvoice; "Posting Date")
            {
            }
            column(Generated_By; GeneratedBy)
            {

            }
            column(TimeGenerated; TimeGenerated)
            {

            }
            column(logo; CompInfo.Picture)
            {

            }
            column(CompanyName; CompInfo.Name)
            {

            }
            dataitem("Invoice Lns"; "Invoice Lns")
            {
                DataItemLink = "Invoice Code" = field("Entry Code");


                column(Description_InvoiceLns; Description)
                {
                }
                column(InvoiceCode_InvoiceLns; "Invoice Code")
                {
                }
                column(InvoicedAmount_InvoiceLns; "Invoiced Amount")
                {
                }
            }


        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.get();
        CompInfo.CalcFields(Picture)

    end;

    var
        GeneratedBy: Label 'Generated By';
        TimeGenerated: Label 'TimeGenerated';
        CompInfo: Record "Company Information";
        User2: Record User;

}


