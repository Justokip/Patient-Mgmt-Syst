page 50109 "Patient Form"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;


    layout
    {
        area(Content)
        {
            group("SECTION A:PATIENT'S DATA")
            {
                Editable = OpenEdit;
                group("Patient's BioData")
                {
                    field("Admission No"; Rec."No.")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Admission No field.';
                    }
                    field("First Name"; Rec."First Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the First Name field.';
                    }
                    field("Middle Name"; Rec."Middle Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Middle Name field.';
                    }
                    field("Last Name"; Rec."Last Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Surname field.';
                    }
                    field("Full Name"; Rec.Name)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Full Name field.';
                    }
                    field(Gender; Rec.Gender1)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Gender field.';
                    }
                    field("Date of Birth"; Rec."Date of Birth1")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Date of Birth field.';
                    }
                    field(Age; Rec.Age1)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Age field.';
                    }
                    field("Date"; Rec."Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Date field.';
                    }
                    field("Status From Lab"; Rec."Status From Lab")
                    {
                        Visible = false;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Status from Lab field.';
                    }
                    field(Status; Rec.Status1)
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Status field.';
                    }
                }
                group("Patient's Address")
                {
                    field("Phone Number"; Rec."Phone No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Phone Number field.';
                    }
                    field("ID/Birth Certificate/Passport"; Rec."ID/Birth Certificate/Passport")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the ID/Birth Certificate/Passport field.';
                    }
                    field("Postal-Address"; Rec.Address)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Postal-Address field.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Village field.';
                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the County field.';
                    }
                }
                group("Bank Details")
                {
                    field("Medical Cover"; Rec."Medical Cover")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Medical Cover field.';
                    }
                    field("Customer Posting Group"; Rec."Customer Posting Group")
                    {
                        ApplicationArea = All;
                        Visible = false;
                        ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                    }
                }

            }
            part(data; "Next of Kin List")
            {
                Editable = OpenEdit;
                ApplicationArea = all;
                SubPageLink = "Kin Code" = field("No.");
            }

            group("SECTION B:TRIAGE")
            {
                Editable = TriageEdit;
                Visible = (Rec.Status1 = Rec.Status1::Triage) OR (Rec.Status1 = rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);

                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Temperature; Rec.Temperature)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Temperature field.';
                    ShowMandatory = true;
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Height field.';
                    ShowMandatory = true;
                }
                field("Blood pressure"; Rec."Blood pressure")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Blood Pressure field.';
                }
                field("Blood Sugar"; Rec."Blood Sugar")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Blood Sugar field.';
                }


            }
            group("SECTION C:DOCTORS")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);

                part(Lines5; "Consultation List")
                {
                    Editable = DoctorEdit;
                    Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                    Caption = 'Consultation Fee';
                    ApplicationArea = all;
                    SubPageLink = "consultation Code" = field("No.");
                }
            }
            part(line5; "Examination List")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                ApplicationArea = All;
                SubPageLink = "examination code" = field("No.");
            }
            part(line4; "Sysmptoms List")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                ApplicationArea = All;
                SubPageLink = "Symptoms Code" = field("No.");
            }
            part(line6; "Diagnosis List")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                ApplicationArea = All;
                SubPageLink = "Diagnosis Code" = field("No.");
            }
            part(line7; "Labresults List")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                    (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                ApplicationArea = All;
                SubPageLink = "LR Code" = field("No.");
            }
            part(line8; "Prescription List")
            {
                Editable = DoctorEdit;
                Visible = (Rec.Status1 = Rec.Status1::Doctor) OR ((Rec.Status1 = Rec.Status1::Laboratory) and
                (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor")) or (Rec.Status1 = rec.Status1::Discharged);
                ApplicationArea = All;
                SubPageLink = "Prescription Code" = field("No.");
            }
            group("SECTION D:LABORATORY")
            {
                Editable = LabEdit;
                Visible = (Rec.Status1 = Rec.Status1::Laboratory) and (rec."Status From Lab" = rec."Status From Lab"::Open) or
                (rec.Status1 = rec.Status1::Discharged);

                part(line11; "Labresults List")
                {
                    Editable = LabEdit;
                    Visible = (Rec.Status1 = Rec.Status1::Laboratory) and (rec."Status From Lab" = rec."Status From Lab"::Open)
                    or (rec.Status1 = rec.Status1::Discharged);
                    ApplicationArea = All;
                    SubPageLink = "LR Code" = field("No.");
                }
            }
            group("SECTION E: PHARMACY")
            {
                Editable = PharmEdit;
                Visible = (Rec.Status1 = Rec.Status1::Pharmacy) or
               (Rec.Status1 = rec.Status1::Discharged);
                part(line111; "Prescription List")
                {
                    Editable = PharmEdit;
                    Visible = (Rec.Status1 = Rec.Status1::Pharmacy) or
                     (Rec.Status1 = rec.Status1::Discharged);
                    ApplicationArea = All;
                    SubPageLink = "Prescription Code" = field("No.");
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
                action("Send to Triage")
                {
                    Visible = Rec.Status1 = Rec.Status1::Open;
                    ApplicationArea = All;
                    Caption = 'Send to Triage';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        Rec.TestField("First Name");
                        Rec.TestField("Last Name");
                        Rec.TestField("Date of Birth1");
                        Rec.TestField("ID/Birth Certificate/Passport");
                        Rec.TestField("Phone No.");
                        rec.TestField(Address);
                        Rec.TestField(Gender1);
                        ActionManagement.Sendtotriage(Rec);
                        CurrPage.Close();


                    end;
                }
                action("Send to Doctor")
                {

                    Visible = Rec.Status1 = Rec.Status1::"Triage";
                    ApplicationArea = All;
                    Caption = 'Send to Doctor';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        // Rec.TestField(Weight);
                        // Rec.TestField(Height);
                        // Rec.TestField(Temperature);
                        // Rec.TestField("Blood pressure");
                        ActionManagement.Sendtodoctor(Rec);
                        CurrPage.Close();

                    end;
                }
                action("Send to Laboratory")
                {
                    Visible = Rec.Status1 = Rec.Status1::Doctor;
                    ApplicationArea = All;
                    Caption = 'Send to Laboratory';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.Sendtolab(Rec);
                        CurrPage.Close();

                    end;
                }
                action("Send to Pharmacy")
                {
                    Visible = Rec.Status1 = Rec.Status1::Doctor;
                    ApplicationArea = All;
                    Caption = 'Send to Pharmacy';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.Sendtopharmacy(Rec);
                        CurrPage.Close();
                    end;
                }
                action("Back to Doctor")
                {
                    Visible = (Rec.Status1 = Rec.Status1::"Laboratory") AND (Rec."Status From Lab" = Rec."Status From Lab"::Open);
                    ApplicationArea = All;
                    Caption = 'Back to Doctor';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.StatusFromLab(Rec);
                        CurrPage.Close();
                    end;
                }
                action("Discharged Patients")
                {
                    Visible = (rec.Status1 = rec.Status1::Pharmacy);
                    ApplicationArea = All;
                    Caption = 'Discharged Patients';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    var
                        Discharged: Record customer;
                        Pativc: Record "Patient Invoice";
                        patrcpt: Record "Patient Receipt";
                        finance: Codeunit "Finance Management1";
                        custlegdr: Record "Cust. Ledger Entry";
                        countrec: Integer;
                    begin
                        Discharged.Reset();
                        Discharged.SetRange("No.", Rec."No.");
                        if Discharged.FindFirst() then begin
                            Discharged.CalcFields(Balance);
                            if Discharged.Balance <> 0 then
                                Error('You have unpaid invoices. Please settle them before discharge.');
                            custlegdr.Reset();
                            custlegdr.SetRange("Customer No.", Discharged."No.");
                            custlegdr.SetRange("Document Type", custlegdr."Document Type"::" ");
                            RecCount := custlegdr.Count;
                            if RecCount = 0 then
                                Error('You have to settle pending payments before discharged!');
                            if RecCount <> 0 then
                                Message('You have settle your payments. Discharge the patient');
                            ActionManagement.discharged(Rec);
                            CurrPage.Close();

                        end;
                    end;
                }
                action("Sending it back to Laboratory")
                {
                    Visible = (Rec.Status1 = Rec.Status1::"Laboratory") AND (Rec."Status From Lab" = Rec."Status From Lab"::"Back to Doctor");
                    ApplicationArea = All;
                    Caption = 'Send to Laboratory';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.Sendtolab1(Rec);
                        CurrPage.Close();

                    end;
                }
                action(" Doc Send to Pharmacy")
                {
                    Visible = (Rec.Status1 = Rec.Status1::"Laboratory") AND (Rec."Status From Lab" = Rec."Status From Lab"::"Back to Doctor");
                    ApplicationArea = All;
                    Caption = 'Send to Pharmacy';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.Sendtopharmacy1(Rec);
                        CurrPage.Close();

                    end;
                }
                action("Doctor Discharged Patients")
                {
                    Visible = (Rec.Status1 = Rec.Status1::Doctor) or
                    ((Rec.Status1 = Rec.Status1::Laboratory) and (rec."Status From Lab" = rec."Status From Lab"::"Back to Doctor"));
                    ApplicationArea = All;
                    Caption = 'Discharged Patients';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        ActionManagement.discharged1(Rec);
                        CurrPage.Close();
                    end;

                }
            }
        }
    }
    var
        ActionManagement: Codeunit "Page Management Actions";
        TriageEdit: Boolean;
        LabEdit: Boolean;
        DoctorEdit: Boolean;
        PharmEdit: Boolean;
        OpenEdit: Boolean;
        finance: Codeunit "Finance Management1";
        RecCount: Integer;



    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetPageControl();
    end;

    //triage
    procedure SetPageControl()

    var
        PatientForm: Record "Patient Admission Form";
    begin
        OpenEdit := true;
        if (Rec.Status1 = Rec.Status1::Triage) or (Rec.Status1 = Rec.Status1::Doctor) or
        (Rec.Status1 = rec.Status1::Laboratory) or (rec.Status1 = rec.Status1::Pharmacy) or
        (rec.Status1 = rec.Status1::Discharged) or (Rec.Status1 = Rec.Status1::"Back to Doctor")
           then begin
            OpenEdit := false;
        end;
        TriageEdit := true;
        if (rec.Status1 = rec.Status1::Doctor) or (rec.Status1 = rec.Status1::Discharged) or
         (Rec.Status1 = Rec.Status1::"Back to Doctor") or (Rec.Status1 = rec.Status1::Laboratory) or
         (rec.Status1 = rec.Status1::Pharmacy) then begin
            TriageEdit := false;
        end;
        DoctorEdit := true;
        if ((rec.Status1 = rec.Status1::Laboratory) and (rec."Status From Lab" = rec."Status From Lab"::Open)) or (rec.Status1 = rec.Status1::Discharged) or
         (rec.Status1 = rec.Status1::Pharmacy) then begin
            DoctorEdit := false;
        end;
        LabEdit := true;
        if (rec.Status1 = rec.Status1::Open) or (rec.Status1 = rec.Status1::Discharged) then begin
            LabEdit := false;
        end;
        PharmEdit := true;
        if rec.Status1 = rec.Status1::Open then begin
            PharmEdit := false;
        end;
    end;
}
