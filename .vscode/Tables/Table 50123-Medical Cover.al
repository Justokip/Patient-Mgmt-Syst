table 50123 "Medical Cover"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Insurance Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Insurance Code';
          //  Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Insurance Code" <> xRec."Insurance Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Insurance Code");
                    NoseriesManagement.TestManual(HospitalSetup."Insurance Code");
                end;
            end;
        }
        field(2; "Insurance Type"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Insurance Type';
        }
        field(3; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(pk; "Insurance Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Insurance Code", "Insurance Type")
        {

        }
        fieldgroup(Bricks; "Insurance Code", "Insurance Type")
        {

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
        if "Insurance Code" = ' ' then
            HospitalSetup.TestField("Insurance Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Insurance Code", xRec."No. Series", 0D, "Insurance Code", "No. Series");
    end;

}