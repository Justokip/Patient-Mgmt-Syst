codeunit 50105 "Finance Management1"
{
    trigger OnRun()
    begin

    end;

    var
        //invoice
        Invoicelns1: Label '%1 has already been posted!';
        Invoicelns2: Label 'Are you sure you want to post %1';
        // receipt
        rcptlns1: Label '%1 has already been posted!';
        rcptlns2: Label 'Are you sure you want to post %1';
    //invoice
    procedure PostedInvoice(var inv: Record "Patient Invoice")

    var
        LineNo: Integer;
        HospitalSetup: Record "Hospital Setup";
        InvLines: Record "Invoice Lns";
        JnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register";
        Custntry: Record "Cust. Ledger Entry";


    begin
        with inv do begin
            if not Confirm(Invoicelns2, false, "Entry Code") then
                exit;
            if Post then
                Error(Invoicelns1, "Entry Code");

            HospitalSetup.Get();
            HospitalSetup.TestField("General Journal Batch");
            HospitalSetup.TestField("General Journal Template");
            Inv.TestField("Posting Date");
            Inv.TestField("Invoiced Amount");
            Inv.TestField("Admission No");

            JnlBatch.Init();
            JnlBatch."Journal Template Name" := HospitalSetup."General Journal Template";
            JnlBatch.Name := "Entry Code";
            if not JnlBatch.Get(HospitalSetup."General Journal Template", "Entry Code") then
                JnlBatch.Insert();

            InvLines.Reset();
            invLines.SetRange(InvLines."Invoice Code", "Entry Code");
            if InvLines.FindSet() then begin
                repeat
                    LineNo := LineNo + 1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
                    GenJnlLine."Journal Batch Name" := JnlBatch.Name;
                    GenJnlLine."Line No." := LineNo;

                    // Cr
                    GenJnlLine."Account Type" := HospitalSetup."Bal.Account Type";
                    GenJnlLine."Account No." := HospitalSetup."Balancing Acc. No.";
                    GenJnlLine.Validate("Account No.");
                    GenJnlLine."Posting Date" := "Posting Date";
                    GenJnlLine."Document No." := InvLines."Invoice Code";
                    GenJnlLine.Description := StrSubstNo('%1 for payment no %2', InvLines."Bal.Account Type", "Entry Code");

                    // Dr
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                    GenJnlLine.Validate("Bal. Account Type");
                    GenJnlLine."Bal. Account No." := "Admission No";
                    GenJnlLine.Amount := -Round(invlines."Invoiced Amount");
                    GenJnlLine.Validate(Amount);
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert();
                until InvLines.Next() = 0;
            end;
        end;
        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", HospitalSetup."General Journal Template");
        GenJnlLine.SetRange("Journal Batch Name", inv."Entry Code");
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnlLine);

        GLRegister.Reset();
        GLRegister.SetRange("Journal Batch Name", inv."Entry Code");
        if GLRegister.find('-') then begin
            if inv.Post = false then begin
                if Confirm('Are you sure you want to post?', true) then begin
                    inv.Post := true;
                    inv.Modify();
                    Message('Posted Successfully');
                    if not Confirm('Are you sure you want to post?', false) then begin
                        inv.Post := false;
                        inv.Modify(false);
                    end;
                end;
            end;

            Custntry.Reset();
            Custntry.SetRange("Document No.", inv."Entry Code");
            if Custntry.FindSet() then begin
                Custntry."Document Type" := Custntry."Document Type"::Invoice;
                Custntry.Modify();
            end;
        end;
    end;



    //receipt
    procedure Postedrcpt(var rcpt: Record "Patient Receipt")
    var
        HospSetup: Record "Hospital Setup";
        rcptlns: Record "Receipt Lns";
        JrnlBatch: Record "Gen. Journal Batch";
        GLRegistr: Record "G/L Register";
        custrlgr: Record "Cust. Ledger Entry";
        GnJrnln: Record "Gen. Journal Line";
        inv: Record "Patient Invoice";
        LineNo1: Integer;

    // begin
    begin
        with rcpt do begin
            if not Confirm(rcptlns2, false, "Receipt code") then
                exit;
            if Post then
                Error(rcptlns1, "Receipt code");
            HospSetup.Get();
            HospSetup.TestField("General Journal Batch");
            HospSetup.TestField("General Journal Template");
            rcpt.TestField("Receipt code");
            rcpt.TestField("Receipt Amount");
            rcpt.TestField("Receipt Date");
            rcpt.TestField("Posting Date");

            JrnlBatch.Init();
            JrnlBatch."Journal Template Name" := HospSetup."General Journal Template";
            JrnlBatch.Name := "Receipt code";
            if not JrnlBatch.Get(HospSetup."General Journal Template", "Receipt code") then
                JrnlBatch.Insert();
            //cr
            GnJrnln.Reset();
            GnJrnln.SetRange(GnJrnln."Journal Template Name", HospSetup."General Journal Template");
            GnJrnln.SetRange(GnJrnln."Journal Batch Name", "Receipt code");
            GnJrnln.DeleteAll();
            LineNo1 := LineNo1 + 1000;
            GnJrnln.Init();
            GnJrnln."Journal Template Name" := JrnlBatch."Journal Template Name";
            GnJrnln."Journal Batch Name" := JrnlBatch.Name;
            GnJrnln."Line No." := LineNo1;
            GnJrnln."Account Type" := GnJrnln."Account Type"::Customer;
            GnJrnln."Account No." := "Account No";
            GnJrnln.Validate("Account No.");
            GnJrnln."Posting Date" := "Posting Date";
            GnJrnln."Document No." := "Admission No";
            GnJrnln.Description := StrSubstNo('%1 for payment no %2', rcpt."Account Type", "Receipt code");
            //dr
            GnJrnln."Bal. Account Type" := GnJrnln."Bal. Account Type"::"Bank Account";
            GnJrnln."Bal. Account No." := "Bank Account";
            GnJrnln.Validate("Bal. Account No.");
            GnJrnln.Amount := -Round("Receipt Amount");
            GnJrnln.Validate(Amount);
            if GnJrnln.Amount <> 0 then
                GnJrnln.Insert();
        end;

        GnJrnln.Reset();
        GnJrnln.SetRange("Journal Template Name", HospSetup."General Journal Template");
        GnJrnln.SetRange("Journal Batch Name", rcpt."Receipt code");
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GnJrnln);


        GLRegistr.Reset();
        GLRegistr.SetRange("Journal Batch Name", rcpt."Receipt code");
        if GLRegistr.Find('-') then begin
            if rcpt.Post = false then begin
                if Confirm('Are you sure you want to post?', true) then begin
                    rcpt.Post := true;
                    rcpt.Modify();
                    if not Confirm('Are you sure you want to post?', false) then begin
                        rcpt.Post := false;
                        rcpt.Modify(false);
                    end;
                end;
            end;

            custrlgr.Reset();
            custrlgr.SetRange("Document No.", rcpt."Receipt code");
            if custrlgr.FindSet() then begin
                custrlgr."Document Type" := custrlgr."Document Type"::Payment;
                custrlgr.Modify();
            end;
        end;
    end;
}

