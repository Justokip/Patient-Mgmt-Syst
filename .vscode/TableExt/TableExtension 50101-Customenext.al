tableextension 50101 CustomerExt extends Customer
{
    fields
    {
        field(9007; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(9008; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(9009; "Last Name"; Text[50])
        {
            Caption = 'Surname';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(111111; "Date of Birth2"; Date)
        {
            Caption = 'Date of Birth';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Age1 := Date2DMY(WorkDate, 3) - Date2DMY("Date Of Birth2", 3);
                if "Date of Birth2" > WorkDate() then begin
                    Error('Age is Invalid!!');
                end;
            end;
        }
        field(111121; "Date of Birth1"; Date)
        {
            Caption = 'Date of Birth1';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                setup: Record "Hospital Setup";
            begin
                Age1 := Date2DMY(WorkDate, 3) - Date2DMY("Date Of Birth1", 3);
                if "Date of Birth1" > WorkDate() then begin
                    Error('Age is Invalid!!');
                    Setup.Get();
                    if "Date of Birth1" < Setup."Minimum year of birth" then begin
                        Error('Invalid age');
                    end;
                end;
            end;
        }
        field(9011; "Age1"; Integer)
        {
            Caption = 'Age';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(9012; "Weight"; Decimal)
        {
            Caption = 'Weight(Kgs)';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(9013; "Blood pressure"; Text[250])
        {
            Caption = 'Blood Pressure(systolic/diastolic mm Hg)';
            DataClassification = CustomerContent;
        }
        field(9014; "Blood Sugar"; Text[250])
        {
            Caption = 'Blood Sugar(mmol/L)';
            DataClassification = CustomerContent;
        }
        field(9015; "Status1"; Enum Agenda)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(9017; "ID/Birth Certificate/Passport"; Text[100])
        {
            Caption = 'ID/Birth Certificate/Passport';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                AppRec: Record "Patient Admission Form";
                i: Integer;
                IDNoCannotContainLetters: Label 'The ID No. must not have letters';
            begin
                AppRec.Reset();
                AppRec.SetRange("ID/Birth Certificate/Passport", Rec."ID/Birth Certificate/Passport");
                if AppRec.FindFirst() then
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

        field(9020; "Date"; Date)
        {
            Caption = 'Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9021; "Height"; Decimal)
        {
            Caption = 'Height(m)';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(9022; "Temperature"; Decimal)
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
        field(9023; "Status From Lab"; Enum Agenda)
        {
            Caption = 'Status from Lab';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9024; "Gender1"; Enum "Patient Gender")
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;
        }
        field(9025; "Lab Results"; Enum "Lab Results")
        {
            Caption = 'Lab Results';
            DataClassification = CustomerContent;
        }
        field(9026; "Customer Type1"; option)
        {
            OptionMembers = Customers,Patient;
            OptionCaption = 'Customers, Patient';
            DataClassification = CustomerContent;
        }
        modify(County)
        {
            CaptionClass = 'County';
        }
        field(9027; "Medical Cover"; code[50])
        {
            Caption = 'Payment Method';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                pymt: Record "Payment Method";
            begin
                if pymt.get("Medical Cover") then begin
                    "Medical Cover" := pymt.Description;
                end;
            end;
        }

    }
    trigger OnBeforeInsert()
    var
        myInt: Integer;
    begin
        Date := WorkDate()
    end;



}