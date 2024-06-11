table 50111 "Items Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Lab Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Lab Code';
           // Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Lab Code" <> xRec."Lab Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Lab Code");
                    NoseriesManagement.TestManual(HospitalSetup."Lab Code");
                end;
            end;

        }
        field(2; "Test Type"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Test Type';
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            caption = 'Description';
        }
        field(4; "Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Cost';
        }
        field(5; "Available"; Boolean)
        {
            Caption = 'Available';
            DataClassification = CustomerContent;
        }
        field(6; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Lab Code")
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
        if "Lab Code" = ' ' then
            HospitalSetup.TestField("Lab Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Lab Code", xRec."No. Series", 0D, "Lab Code", "No. Series");
    end;

}