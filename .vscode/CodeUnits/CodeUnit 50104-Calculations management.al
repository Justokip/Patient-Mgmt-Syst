codeunit 50104 "Unit Calc. Management"
{
    procedure CalcCostManagement(var prescriptionRec: Record Prescription)

    begin
        prescriptionRec.Cost := prescriptionRec.Quantity * prescriptionRec."Unit Cost";
        prescriptionRec.Modify;
    end;
}




