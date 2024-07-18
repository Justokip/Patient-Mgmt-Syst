table 50100 "Patient Admission Form"
{
    Caption = 'Patient Admission Form';
    DataClassification = CustomerContent;
    DrillDownPageId = "Patient form";

    fields
    {
        field(1; "Admission No"; Code[50])
        {
            Caption = 'Admission No';
            DataClassification = CustomerContent;
            Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Admission No" <> xRec."Admission No" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Admission No");
                    NoseriesManagement.TestManual(HospitalSetup."Admission No");
                end;
            end;
        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Surname';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(7; "Full Name"; Text[150])
        {
            Caption = 'Full Name';
            DataClassification = CustomerContent;
            Editable = false;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(8; "Gender1"; Enum "Patient Gender")
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;
        }
        field(5; "Date of Birth1"; Date)
        {
            Caption = 'Date of Birth1';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                Age1 := Date2DMY(WorkDate, 3) - Date2DMY("Date Of Birth1", 3);
                if "Date of Birth1" > WorkDate() then begin
                    Error('Age is Invalid!!');
                    HospitalSetup.Get();
                    if "Date of Birth1" < HospitalSetup."Minimum year of birth" then begin
                        Error('Invalid age');
                    end;

                end;
            end;
        }
        field(6; "Age1"; Integer)
        {
            Caption = 'Age';
            Editable = false;
            DataClassification = CustomerContent;


        }
        field(10; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Weight"; Decimal)
        {
            Caption = 'Weight(Kgs)';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Weight < 0 then begin
                    Error('Weight is invalid');
                end;

            end;
        }
        field(13; "Blood pressure"; Text[250])
        {
            Caption = 'Blood Pressure(systolic/diastolic mm Hg)';
            DataClassification = CustomerContent;
        }
        field(14; "Blood Sugar"; Text[250])
        {
            Caption = 'Blood Sugar(mmol/L)';
            DataClassification = CustomerContent;
        }
        field(15; "Examine"; Text[250])
        {
            Caption = 'Examine';
            DataClassification = CustomerContent;
        }
        field(20; "Issue Medication"; Text[250])
        {
            Caption = 'Issue Medication';
            DataClassification = CustomerContent;
        }
        field(42; "Lab Results"; Text[250])
        {
            Caption = 'Lab Results';
            DataClassification = CustomerContent;
        }
        field(22; "Prescription"; Text[250])
        {
            Caption = 'Prescription';
            DataClassification = CustomerContent;
        }
        field(23; "Status1"; Enum Agenda)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(24; "Admit"; Text[200])
        {
            Caption = 'Admit';
            DataClassification = CustomerContent;
        }
        field(32; "Postal-Address"; Text[100])
        {
            Caption = 'Postal-Address';
            DataClassification = CustomerContent;
        }
        field(27; "County"; Text[50])
        {
            Caption = 'County';
            DataClassification = CustomerContent;
        }
        field(28; "City"; Text[50])
        {
            Caption = 'City';
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                cnty: Record "Post Code";
                cnty1: Record Customer;
            begin
                if cnty.Get(County) then begin
                    County := cnty.County;
                    cnty1.Address := cnty."Postal Address";
                    City := cnty.City;
                end;
            end;
        }
        field(29; "Phone Number"; Text[20])
        {
            Caption = 'Phone Number';
            DataClassification = CustomerContent;
        }
        field(30; "ID/Birth Certificate/Passport"; Text[100])
        {
            Caption = 'ID/Birth Certificate/Passport No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                patient: Record "Patient Admission Form";
                i: Integer;
                IDNoCannotContainLetters: Label 'The ID No. must not have letters';
            begin
                patient.Reset();
                patient.SetRange("ID/Birth Certificate/Passport", Rec."ID/Birth Certificate/Passport");
                if patient.FindFirst() then
                    Error('The record with the ID No. %1 already exists', "ID/Birth Certificate/Passport");

                for i := 1 to StrLen("ID/Birth Certificate/Passport") do begin
                    if ("ID/Birth Certificate/Passport"[i] >= 'A') and ("ID/Birth Certificate/Passport"[i] <= 'Z') or
                       ("ID/Birth Certificate/Passport"[i] >= 'a') and ("ID/Birth Certificate/Passport"[i] <= 'z') then
                        FieldError("ID/Birth Certificate/Passport", IDNoCannotContainLetters);
                end;

                if StrLen("ID/Birth Certificate/Passport") < 7 then
                    Error('The ID No. must be more than 7 digits');
                if StrLen("ID/Birth Certificate/Passport") > 8 then
                    Error('The ID No. must be less than 8 digits');
            end;
        }

        field(31; "Date"; Date)
        {
            Caption = 'Date';
            Editable = false;

            DataClassification = CustomerContent;
        }
        field(44; "Height"; Decimal)
        {
            Caption = 'Height(m)';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Height < 0 then begin
                    Error('Nagative value is invalid');
                end;
            end;
        }
        field(33; "Temperature"; Decimal)
        {
            Caption = 'Temperature(°C)';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Temperature < 0 then begin

                end;
            end;
        }
        field(34; "Diagnosis"; Text[250])
        {
            Caption = 'Diagnosis';
            DataClassification = CustomerContent;
        }
        field(35; "Symptoms"; Text[250])
        {
            Caption = 'Symptoms';
            DataClassification = CustomerContent;
        }
        field(36; "Next of Kin"; Text[150])
        {
            Caption = 'Next of Kin';
            DataClassification = CustomerContent;
        }
        field(37; "Guardian"; Text[150])
        {
            Caption = 'Next of Kin';
            DataClassification = CustomerContent;
        }
        field(38; "Next of Kin Number"; Text[50])
        {
            Caption = 'Next of Kin Number';
            DataClassification = CustomerContent;
        }
        field(39; "Guardian's Nmuber"; Text[50])
        {
            Caption = 'Next of Kin Number';
            DataClassification = CustomerContent;
        }
        field(40; "Status From Lab"; Enum Agenda)
        {
            Caption = 'Status from Lab';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(41; "User ID"; Code[50])
        {
            FieldClass = FlowFilter;
            Caption = 'User ID';
        }
        field(21; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            DataClassification = CustomerContent;
        }
        field(9027; "Medical Cover"; code[50])
        {
            Caption = 'Payment Method';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;



        }
        field(68; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Admission No")
        {
            Clustered = true;
        }
    }
    var

        HospitalSetup: Record "Hospital Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        HospitalSetup: Record "Hospital Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        HospitalSetup.Get();
        if "Admission No" = ' ' then
            HospitalSetup.TestField("Admission No");
        NoSeriesManagement.InitSeries(HospitalSetup."Admission No", xRec."No. Series", 0D, "Admission No", "No. Series");
        Date := WorkDate();
    end;

}
