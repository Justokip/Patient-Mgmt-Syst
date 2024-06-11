table 50118 "Symptoms Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sym Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sym Code';
            Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Sym Code" <> xRec."Sym Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Sym Code");
                    NoseriesManagement.TestManual(HospitalSetup."Sym Code");
                end;
            end;

        }
        field(2; "Description"; text[100])
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
        key(PK; "Sym Code")
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
        if "Sym Code" = ' ' then
            HospitalSetup.TestField("Sym Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Sym Code", xRec."No. Series", 0D, "Sym Code", "No. Series");
    end;

}
