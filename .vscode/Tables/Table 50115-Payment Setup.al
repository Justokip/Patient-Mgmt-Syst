table 50115 "Payment Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "setup code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Setup Code';
            //Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "setup code" <> xRec."setup code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("setup code");
                    NoseriesManagement.TestManual(HospitalSetup."setup code");
                end;
            end;

        }
        field(2; "Payment Method"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Method';
        }
        field(3; "Payment Number"; Integer)
        {
            Caption = 'Payment Number';
            DataClassification = CustomerContent;
        }


        field(5; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(pk; "setup code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "setup code", "Payment Method")
        {
        }
        fieldgroup(Brick; "setup code", "Payment Method")
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
        if "setup code" = ' ' then
            HospitalSetup.TestField("setup code");
        NoSeriesManagement.InitSeries(HospitalSetup."setup code", xRec."No. Series", 0D, "setup code", "No. Series");
    end;
}