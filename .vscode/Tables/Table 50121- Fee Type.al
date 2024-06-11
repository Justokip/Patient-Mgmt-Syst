table 50121 "Fee Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fee Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Lab Code';
            Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Fee Code" <> xRec."Fee Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Fee Code");
                    NoseriesManagement.TestManual(HospitalSetup."Fee Code");
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
        field(6; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Fee Code")
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
        if "Fee Code" = ' ' then
            HospitalSetup.TestField("Fee Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Fee Code", xRec."No. Series", 0D, "Fee Code", "No. Series");
    end;

}