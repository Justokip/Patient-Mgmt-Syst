page 50113 "Discharged Patients Form"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "customer";
    Editable = false;
    layout
    {
        area(Content)
        {
            group("SECTION A:PATIENT'S DATA")
            {

                field("Admission No"; Rec."No.")
                {
                    ApplicationArea = All;
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
                field("Full Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Full Name field.';
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

                field("Postal-Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Postal-Address field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Village field.';
                }
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
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status1)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Status From Lab"; Rec."Status From Lab")
                {
                    Visible = Rec.Status1 = Rec.Status1::Laboratory;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status from Lab field.';
                }

            }
            part(data; "Next of Kin List")

            {
                Editable = false;
                ApplicationArea = all;
                SubPageLink = "Kin Code" = field("No.");
            }
            group("SECTION B:TRIAGE")
            {
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Temperature; Rec.Temperature)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Temperature field.';
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Height field.';
                }
                field("Blood pressure"; Rec."Blood pressure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blood Pressure field.';
                }
                field("Blood Sugar"; Rec."Blood Sugar")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blood Sugar field.';
                }


            }
            label("SECTION C:DOCTORS")
            {
                Style = strong;
            }
            part(Lines5; "Consultation List")
            {
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                Caption = 'Consultation Fee';
                ApplicationArea = all;
                SubPageLink = "consultation Code" = field("No.");
            }

            part(line5; "Examination List")
            {
                ApplicationArea = All;
                SubPageLink = "examination code" = field("No.");
            }

            part(line4; "Sysmptoms List")
            {
                ApplicationArea = All;
                SubPageLink = "Symptoms Code" = field("No.");
            }
            part(line6; "Diagnosis List")
            {
                ApplicationArea = All;
                SubPageLink = "Diagnosis Code" = field("No.");
            }
            part(line8; "Labresults List")
            {
                ApplicationArea = All;
                SubPageLink = "LR Code" = field("No.");
            }
            part(line7; "Prescription List")
            {
                ApplicationArea = All;
                SubPageLink = "Prescription Code" = field("No.");
            }
            label("SECTION D:LABORATORY")
            {
                Style = strong;
            }
            part(line11; "Labresults List")

            {
                ApplicationArea = All;
                SubPageLink = "LR Code" = field("No.");
            }
            label("SECTION E: PHARMACY")
            {
                Style = strong;
            }



            part(line111; "Prescription List")
            {
                ApplicationArea = All;
                SubPageLink = "Prescription Code" = field("No.");
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
                    Visible = Rec.Status1 = Rec.Status1::Triage;
                    ApplicationArea = All;
                    Caption = 'Send to Triage';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin


                    end;
                }
                action(SendApp1)
                {
                    Visible = Rec.Status1 = Rec.Status1::Doctor;
                    ApplicationArea = All;
                    Caption = 'Send to Doctor';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin


                    end;
                }
                action(SendApp2)
                {
                    Visible = Rec.Status1 = Rec.Status1::Laboratory;
                    ApplicationArea = All;
                    Caption = 'Send to Laboratory';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin


                    end;
                }
                action(SendApp3)
                {
                    Visible = Rec.Status1 = Rec.Status1::Pharmacy;
                    ApplicationArea = All;
                    Caption = 'Send to Pharmacy';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin


                    end;
                }
                action(SendApp4)
                {

                    ApplicationArea = All;
                    Caption = 'Discharged Patients';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin


                    end;
                }
            }
        }
    }

}
