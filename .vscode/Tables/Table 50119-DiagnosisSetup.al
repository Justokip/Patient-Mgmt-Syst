table 50119 "Diagnosis Setup"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Diag Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Diag Code'; 
             Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Diag Code" <> xRec."Diag Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Diag Code");
                    NoseriesManagement.TestManual(HospitalSetup."Diag Code");
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
        key(DG; "Diag Code")
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
        if "Diag Code" = ' ' then
            HospitalSetup.TestField("Diag Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Diag Code", xRec."No. Series", 0D, "Diag Code", "No. Series");
    end;
    
}