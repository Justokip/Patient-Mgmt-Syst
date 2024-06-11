table 50103 "Hosp Received Items"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Medicine Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Pharmaceutical Code';
            // NotBlank = true;
            //Editable = false;
            trigger OnValidate()
            var
                HospitalSetup: Record "Hospital Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Medicine Code" <> xRec."Medicine Code" then begin
                    HospitalSetup.Get();
                    HospitalSetup.TestField("Medicine Code");
                    NoseriesManagement.TestManual(HospitalSetup."Medicine Code");
                end;
            end;

        }
        field(99008502; "medicine Type"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Items Type';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(99008504; "Receive Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Receive Date';
            Editable = false;
        }
        field(99008505; "Serial Number"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial Number';
        }
        field(99008506; "Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiry Date';

        }
        field(99008507; "Manufacturing Date"; Date)
        {
            Caption = 'Manufacturing Date';
            DataClassification = CustomerContent;
        }
        field(68; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(8; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            DataClassification = CustomerContent;
        }
        field(99008510; "Status"; enum Status)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Approval Status';
        }
        field(99008509; "Manufacturing company"; text[50])
        {
            Caption = 'Manufacturing Company';
            DataClassification = CustomerContent;
        }
        field(99008512; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(18; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;
        }
        field(99008511; "Post"; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }
        field(19; "Price/Profit Calculation"; Enum "Item Price Profit Calculation")
        {
            Caption = 'Price/Profit Calculation';
        }
        field(20; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            MinValue = 0;
        }
        
    }

    keys
    {
        key(MC; "Medicine Code")
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
        if "Medicine Code" = ' ' then
            HospitalSetup.TestField("Medicine Code");
        NoSeriesManagement.InitSeries(HospitalSetup."Medicine Code", xRec."No. Series", 0D, "medicine code", "No. Series");
        "Receive Date" := WorkDate();
    end;
}