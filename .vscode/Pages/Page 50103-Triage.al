page 50103 "Triage"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Patient Admission Form";


    layout
    {
        area(Content)
        {
            group("SECTION A:PATIENT'S DATA")
            {
                Editable = false;

                field("Admission No"; Rec."Admission No")
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
                field("Full Name"; Rec."Full Name")
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

                field("Postal-Address"; Rec."Postal-Address")
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
                field("Phone Number"; Rec."Phone Number")
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
                SubPageLink = "Kin Code" = field("Admission No");
            }
            group("SECTION B:TRIAGE")
            {
                Visible = Rec.Status1 = Rec.Status1::Triage;

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
                    MultiLine = true;
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
                Visible = Rec.Status1 = Rec.Status1::Doctor;
            }
            part(Lines5; "Consultation List")
            {
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                Caption = 'Consultation Fee';
                ApplicationArea = all;
                SubPageLink = "consultation Code" = field("Admission No");
            }

            part(line5; "Examination List")
            {
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                ApplicationArea = All;
                SubPageLink = "examination code" = field("Admission No");
            }

            part(line4; "Sysmptoms List")
            {
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                ApplicationArea = All;
                SubPageLink = "Symptoms Code" = field("Admission No");
            }
            part(line6; "Diagnosis List")
            {
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                ApplicationArea = All;
                SubPageLink = "Diagnosis Code" = field("Admission No");
            }
            part(line8; "Labresults List")
            {
                Caption = 'Lab';
                Visible = Rec.Status1 = Rec.Status1::Doctor;
                ApplicationArea = All;
                SubPageLink = "LR Code" = field("Admission No");
            }
            part(line7; "Prescription List")
            {
                Visible = Rec.Status1 = Rec.Status1::"Doctor";
                ApplicationArea = All;
                SubPageLink = "Prescription Code" = field("Admission No");
            }
            label("SECTION D:LABORATORY")
            {
                Style = strong;
                Visible = Rec.Status1 = Rec.Status1::Laboratory;
            }
            part(line11; "Labresults List")

            {
                ApplicationArea = All;
                Visible = Rec.Status1 = Rec.Status1::Laboratory;
                SubPageLink = "LR Code" = field("Admission No");
            }
            label("SECTION E: PHARMACY")
            {
                Style = strong;
                Visible = Rec.Status1 = Rec.Status1::Pharmacy;
            }
            part(line111; "Prescription List")
            {
                Visible = Rec.Status1 = Rec.Status1::Pharmacy;
                ApplicationArea = All;
                SubPageLink = "Prescription Code" = field("Admission No");
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
                    Visible = Rec.Status1 = Rec.Status1::Doctor;
                    ApplicationArea = All;
                    Caption = 'Send to Triage';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        // Rec.TestField("Blood pressure");
                        // Rec.TestField("Blood Sugar");

                    end;
                }
                action(SendApp1)
                {
                    ApplicationArea = All;
                    Caption = 'Send to Doctor';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        // Rec.TestField("Blood pressure");
                        // Rec.TestField("Blood Sugar");
                        // Rec.TestField(Temperature);
                        // rec.TestField(Weight);
                        // Rec.TestField(Height);

                        //ActionManagement.Sendtodoctor(Rec);
                        // CurrPage.Close();
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
                        // Rec.TestField("Blood pressure");
                        // Rec.TestField("Blood Sugar");
                        // Rec.TestField(Temperature);
                        // rec.TestField(Weight);
                        // Rec.TestField(Height);

                    end;
                }
                action(SendApp3)
                {
                    Visible = Rec.Status1 = Rec.Status1::Pharmacy;
                    ApplicationArea = All;
                    Caption = 'Send to Pharmarcy';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Patient Admission Form';


                    trigger OnAction()
                    begin
                        // Rec.TestField("Blood pressure");
                        // Rec.TestField("Blood Sugar");
                        // Rec.TestField(Temperature);
                        // rec.TestField(Weight);
                        // Rec.TestField(Height);

                    end;
                }
            }
        }
    }
    // var
    //     ActionManagement: Codeunit "Actions";

}
