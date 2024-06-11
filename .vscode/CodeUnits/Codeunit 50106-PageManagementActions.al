codeunit 50106 "Page Management Actions"
{
    procedure Sendtotriage(var Triage: Record Customer)
    var
        myInt: Integer;
    begin
        if Triage.Status1 = Triage.Status1::Open then begin
            if Confirm('Are you sure you want to send to triage?', true) then begin
                Triage.Status1 := Triage.Status1::Triage;
                Triage.Modify(true);
                Message('Sent to triage Successfully.');
            end
        end;
    end;

    //doctor
    procedure Sendtodoctor(var Doctor: Record Customer)
    var
        myInt: Integer;
    begin
        if Doctor.Status1 = Doctor.Status1::Triage then begin
            if Confirm('Are you sure you want to send to Doctor?', true) then begin
                "Doctor".Status1 := "Doctor".Status1::Doctor;
                Doctor.Modify(true);
                Message('Sent to Doctor Successfully.');
            end;
        end;
    end;

    //from lab
    procedure StatusFromLab(var Lab: Record Customer)
    var
        myInt: Integer;
    begin
        if Lab.Status1 = Lab.Status1::Laboratory then begin
            if Confirm('Are you sure you want to send back to doctor?', true) then begin
                Lab."Status From Lab" := Lab."Status From Lab"::"Back to Doctor";
                Lab.Modify(true);
                Message('Sent back to doctor Successfully.');
            end;
        end;
    end;

    //discharged
    procedure discharged(var "Discharged": Record customer)
    var
        myInt: Integer;
    begin
         if Discharged.Status1 = Discharged.Status1::Pharmacy then begin
            if Confirm('Are you sure you want to Discharge the Patient?', true) then begin
                "Discharged".Status1 := Discharged.Status1::"Discharged";
                Discharged.Modify(true);
                Message('Patient Discharged.');
            end;
        end;
    end;

    //lab results
    procedure discharged1(var "Discharged": Record customer)
    var
        myInt: Integer;

    begin
        if Discharged.Status1 = Discharged.Status1::Laboratory then begin
            if Confirm('Are you sure you want to Discharge the Patient?', true) then begin
                "Discharged".Status1 := Discharged.Status1::"Discharged";
                Discharged.Modify(true);
                Message('Patient Discharged.');
            end;
        end;
    end;
    //lab
    procedure Sendtolab(var Lab2: Record Customer)
    var
        myInt: Integer;
    begin
        if Lab2.Status1 = Lab2.Status1::Doctor then begin
            if Confirm('Are you sure you want to send to Laboratory?', true) then begin
                Lab2.Status1 := Lab2.Status1::Laboratory;
                lab2.Modify(true);
                Message('Sent to Laboratory Successfully.');
            end;
        end;
    end;
    //lab results
    procedure Sendtolab1(var Lab2: Record Customer)
    var
        myInt: Integer;
    begin
        if (Lab2.Status1 = Lab2.Status1::Laboratory) and (Lab2."Status From Lab" = Lab2."Status From Lab"::"Back to Doctor") then begin
            if Confirm('Are you sure you want to send to Laboratory?', true) then begin
                Lab2.Status1 := Lab2.Status1::Laboratory;
                Lab2."Status From Lab" := Lab2."Status From Lab"::Open;
                lab2.Modify(true);
                Message('Sent to Laboratory Successfully.');
            end;
        end;
    end;
    //pharmacy
    procedure Sendtopharmacy(var Pharmacy: Record Customer)
    var
        myInt: Integer;
    begin
        if Pharmacy.Status1 = Pharmacy.Status1::Doctor then begin
            if Confirm('Are you sure you want to send to Pharmacy?', true) then begin
                Pharmacy.Status1 := Pharmacy.Status1::Pharmacy;
                Pharmacy.Modify(true);
                Message('Sent to Pharmacy Successfully.');
            end;
        end;
    end;
    //Lab results
    procedure Sendtopharmacy1(var Pharmacy: Record Customer)
    var
        myInt: Integer;
    begin
        if Pharmacy.Status1 = Pharmacy.Status1::Laboratory then begin
            if Confirm('Are you sure you want to send to Pharmacy?', true) then begin
                Pharmacy.Status1 := Pharmacy.Status1::Pharmacy;
                Pharmacy.Modify(true);
                Message('Sent to Pharmacy Successfully.');
            end;
        end;
    end;
}