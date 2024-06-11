table 50110 "Examination Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "exam code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Exam code';
          //  Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "exam code" <> xRec."exam code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("exam code");
                    NoseriesManagement.TestManual(HospitalSetup."exam code");
                end;
            end;

        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(ec; "exam code")
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
        if "exam code" = ' ' then
            HospitalSetup.TestField("exam code");
        NoSeriesManagement.InitSeries(HospitalSetup."exam code", xRec."No. Series", 0D, "exam code", "No. Series");
    end;
}