report 50100 "Charges Report"
{
    Caption = 'Medical Charges Report';
    DefaultLayout = Word;
    WordLayout = 'Medical Charges Report.docx';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Chrges"; "Charges")
        {
            RequestFilterFields = "Medical fee code";
            column(Medicalfeecode; "Medical fee code")
            {
            }
            column(BankAccountName; "Bank Account Name")
            {
            }
            column(BankAccountNumber; "Bank Account Number")
            {
            }
            column(PaymentType; "Payment Type")
            {
            }
            column(Description; Description)
            {
            }
            column(BalAccountType; "Bal.Account Type")
            {
            }
            column(BalancingAccNo; "Balancing Acc. No.")
            {
            }
            column(Amount; Amount)
            {
            }
            column(AmountSum; "Amount Sum")
            {
            }
        }
        dataitem("Company Info"; "Company Information")
        {
            column(Name; Name) { }
            column(Address; Address) { }
            column(E_Mail; "E-Mail") { }
            column(Picture; Picture) { }


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
        Medicalfeecode: Label 'Medical fee code';
        BankAccountName: Label 'Bank Account Name';
        BankAccountNumber: Label 'BankvAccount Number';
        PaymentType: Label 'Payment Type';
        CompInfo: Record "Company Information";
        Description: Label 'Description';
        BalAccountType: Label 'Bal.Account Type';
        BalancingAccNo: Label 'Balancing Acc. No.';
        Amount: Label 'Amount';
        AmountSum: Label 'AmountSum';
}
