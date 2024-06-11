page 50100 "Hospital Role Center"
{
    Caption = 'RoleCenter';
    PageType = RoleCenter;


    layout
    {
        area(RoleCenter)
        {
            group(group1)
            {
                // part(headline; "Headline RC Administrator")
                // {
                //     ApplicationArea = Basic, suite;
                // }
                part(cue2; CuesGrp)
                {
                    ApplicationArea = All;
                }
            }
            group(grouRole)
            {

            }

        }
    }
    actions
    {
        area(Sections)
        {

            group(RECEPTION)
            {
                Caption = 'RECEPTION';

                action("Patient Admission List")
                {
                    RunObject = page "Customer Lst";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Patient Admission List';
                }

            }
            group(TRIAGE)
            {
                Caption = 'TRIAGE';
                action("Triage List")
                {
                    RunObject = page "Triage List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Triage List';
                }
            }
            group(DOCTOR)
            {
                Caption = 'DOCTOR';
                action("Doctor List")
                {
                    RunObject = page "Doctor List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Doctor List';
                }
                action("Lab Results List")
                {
                    RunObject = page "Lab Rls List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lab Results List';
                }
                action("Discharged Patients")
                {
                    RunObject = page "Discharged Patients";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Discharged Patients';
                }
            }


            group(LABORATORY)
            {

                Caption = 'LABORATORY';

                action("Lab Test")
                {
                    RunObject = page "Lab List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lab List';
                }
            }
            group(PHARMACY)
            {
                Caption = 'PHARMACY';
                action("Issue Drugs")
                {
                    RunObject = page "Patients List";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Patients List';
                }
            }
            group(Finance)
            {
                Caption = 'FINANCE';
                action("Invoice list")
                {
                    RunObject = page "Patient Invoice List";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Patients Invoices';
                }
                action("Posted Invoice List")
                {
                    RunObject = page "Posted invoice List";
                    ApplicationArea = all;
                    Caption = 'Posted Invoices';
                }
                action("Charges")
                {
                    RunObject = page "Charges List";
                    ApplicationArea = all;
                    Caption = 'Charges List';
                    Visible = false;
                }
                action(Receipts)
                {
                    RunObject = page "Receipt List";
                    ApplicationArea = all;
                    Caption = 'Patients Receipts';
                }
                action("Posted Receipts")
                {
                    RunObject = page "Posted Receipt List";
                    ApplicationArea = all;
                    Caption = 'Posted Receipts';
                }
            }
            group("Hospital Setup")
            {
                Caption = 'HOSPITAL SETUP';
                action(Setup)
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Hospital Setup";
                    Caption = 'Setup ';
                }
                action("Items Setup")
                {
                    RunObject = page "Items Setup Lists";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items setup';
                }
                action("Payment Setup")
                {
                    RunObject = page "Payment setup";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Setup';
                }
                action("Symptoms Setup")
                {
                    RunObject = page "Symptoms Setup List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Symptoms Setup';
                }
                action("Diagnosis Setup")
                {
                    RunObject = page "Diagnosis Setup List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Diagnosis Setup';
                }
                action("Examination Setup")
                {
                    RunObject = page "Examination Setup List";
                    ApplicationArea = all;
                    Caption = 'Examination Setup';
                }
                action(fee)
                {
                    RunObject = page "Fee Setup List";
                    ApplicationArea = All;
                    Caption = 'Fee Setup';
                }

            }
            group("HOSPITAL ITEMS")
            {
                Caption = 'HOSPITAL ITEMS';
                action("Items List")
                {
                    RunObject = page "List of Items";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items List';


                }
                action("Received Items")
                {
                    RunObject = page "Hospital Received Items List";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Hospital Received Items List';

                }

            }
            group(Reports)
            {
                Caption = 'REPORTS';
                action("Invoice Report")
                {
                    RunObject = report "Patient Invoice Report";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Patient Invoice Report';
                }
                action("Discharged Patients Report")
                {
                    RunObject = report "Discharged Patients Report";
                    ApplicationArea = all;
                    Caption = 'Dicharged Patient Report';
                }
                action("Patient Data Report")
                {
                    RunObject = report "Patient Data Report";
                    ApplicationArea = All;
                    Caption = ' Patient Data Report';
                }
                action("Patient Receipt Report")
                {
                    RunObject = report "Patient Receipt";
                    ApplicationArea = All;
                    Caption = 'Patient Receipt Report';
                }
                action("LAB Report")
                {
                    RunObject = report "LAB Report";
                    ApplicationArea = All;
                    Caption = 'Lab Report Form';
                }
            }
        }
    }

}


profile Hospital
{
    ProfileDescription = 'Hospital';
    RoleCenter = "Hospital Role Center";
    Caption = 'Patient Management System';
}
