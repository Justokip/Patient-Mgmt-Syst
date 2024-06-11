report 50103 "Patient Data Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Patient Data Report';
    RDLCLayout = 'Patient DataList Report.rdl';
    DefaultLayout = RDLC;



    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(Admission_No; "No.")
            {

            }
            column(Full_Name; "Name")
            {

            }
            column(Gender; Gender1)
            {

            }
            column(Age; Age1)
            {

            }
            column(Address_Customer; Address)
            {
            }
            column(PhoneNo_Customer; "Phone No.")
            {
            }
            column(City_Customer; City)
            {
            }
            column(Weight_Customer; Weight)
            {
            }
            column(Temperature_Customer; Temperature)
            {
            }
            column(IDBirthCertificatePassport_Customer; "ID/Birth Certificate/Passport")
            {
            }
            column(Height_Customer; Height)
            {
            }
            column(DateofBirth_Customer; "Date of Birth1")
            {
            }
            column(Bloodpressure_Customer; "Blood pressure")
            {
            }
            column(BloodSugar_Customer; "Blood Sugar")
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
            column(Address; CompInfo.Address)
            {

            }
            column(name; CompInfo.Name)
            {

            }
            column(email; CompInfo."E-Mail")
            {

            }
            dataitem("Next of Kin"; "Next of Kin")
            {
                DataItemLink = "Kin Code" = field("No.");


                column(KinCode_NextofKin; "Kin Code")
                {
                }
                column(Name_NextofKin; Name)
                {
                }
                column(PhoneNumuber_NextofKin; "Phone Numuber")
                {
                }
                column(Gender_NextofKin; Gender)
                {
                }
            }

            dataitem(Consultation; Consultation)
            {
                DataItemLink = "Consultation Code" = field("No.");
                column(Description_Consultation; Description)
                {
                }
                column(Cost_Consultation; Cost)
                {
                }

            }
            dataitem(Examination; Examination)
            {
                DataItemLink = "examination Code" = field("No.");

                column(Description_Examination; Description)
                {
                }
                column(ExaminationCode_Examination; "Examination Code")
                {
                }
            }
            dataitem(Symptoms; Symptoms)
            {
                DataItemLink = "Symptoms Code" = field("No.");

                column(Description_Symptoms; Description)
                {
                }
                column(SymptomsCode_Symptoms; "Symptoms Code")
                {
                }
            }
            dataitem(Diagnosis; Diagnosis)
            {
                DataItemLink = "Diagnosis Code" = field("No.");
                column(Description_Diagnosis; Description)
                {
                }
                column(DiagnosisCode_Diagnosis; "Diagnosis Code")
                {
                }
            }
            dataitem("Lab Results"; "Lab Results")
            {
                DataItemLink = "LR Code" = field("No.");

                column(Description_LabResults; Description)
                {
                }
                column(LRCode_LabResults; "LR Code")
                {
                }
                column(LabResults_LabResults; "Lab Results")
                {
                }
                column(LabStatus_LabResults; "Lab Status")
                {
                }
                column(Comments_LabResults; Comments)
                {
                }
            }
            dataitem(Prescription; Prescription)
            {
                DataItemLink = "Prescription Code" = field("No.");

                column(Description_Prescription; Description)
                {
                }
                column(Quantity_Prescription; Quantity)
                {
                }
                column(Frequency_Prescription; Frequency)
                {
                }
                column(Period_Prescription; Period)
                {
                }
                column(UnitCost_Prescription; "Unit Cost")
                {
                }
                column(Cost_Prescription; Cost)
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
        Serial_No: Label 'Serial Number';
        GeneratedBy: Label 'Generated By';
        TimeGenerated: Label 'TimeGenerated';
        CompInfo: Record "Company Information";
        User2: Record User;

}


