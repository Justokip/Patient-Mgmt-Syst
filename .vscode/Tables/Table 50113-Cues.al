table 50113 "CuesGrp"
{
    DataClassification = ToBeClassified;
    Caption = 'JUSTUS HEALTHCARE';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Pending Approvals"; Integer)
        {
            CalcFormula = count("Hosp Received Items" where(Status = const("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Pending Approvals Items';

        }
        field(3; "Approved"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Approved Items';
            CalcFormula = count("Hosp Received Items" where(Status = const(Approved)));

        }
        field(4; "Rejected Approval"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Rejected Approval Items';
            CalcFormula = count("Hosp Received Items" where(Status = const(Rejected)));


        }
        field(5; "Canceled Approvals"; Integer)
        {
            CalcFormula = count("Hosp Received Items" where(Status = const(Canceled)));
            FieldClass = FlowField;
            Caption = 'Canceled Approval Items';
        }
        field(7; "Patient Invoice"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Patient Invoice");
            Caption = 'Invoices';
        }
        field(8; "Triage"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer");
            Caption = 'Triage';
        }
        field(9; "Doctor"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer" where(Status1 = const(Doctor), "Status From Lab" = const(Open)));
            Caption = 'Doctor';
        }
        field(10; "Lab"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer" where(Status1 = const(Laboratory), "Status From Lab" = const(Open)));
            Caption = 'Laboratory';
        }
        field(11; "Pharmacy"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer" where(Status1 = const(Pharmacy)));
            Caption = 'Pharmacy';
        }
        field(12; "Labresults"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer" where("Status From Lab" = const("Back to Doctor"), Status1 = const(laboratory)));
            Caption = 'Lab Results';
        }
        field(13; "Discharged"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("customer" where(Status1 = const(Discharged)));
            Caption = 'Discharged';
        }
        field(14; "User ID Filter"; Code[100])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(15; "Posted invoice"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Patient Invoice" where(Post = filter(true)));
            Caption = 'Posted Invoice';
        }
        field(16; "Patient Receipt"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Patient Receipt");
            Caption = 'Receipts';
        }
        field(17; "Posted Receipts"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Patient Receipt" where(Post = filter(true)));
            Caption = 'Posted Receipts';
        }


    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }


    }
}