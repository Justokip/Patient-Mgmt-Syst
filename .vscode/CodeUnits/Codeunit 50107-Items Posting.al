codeunit 50107 "Items Management"
{
    trigger OnRun()
    begin

    end;

    var
        item1: Label 'Are you sure you want to post %1?';
        item2: Label '%1 has already been posted!';

    procedure ItemsPosting(var item: Record "Hosp Received Items")
    var
        HospSetup: Record "Hospital Setup";
        JnlBatch: Record "Item Journal Batch";
        Itmjnline: Record "Item Journal Line";
        itemldgr: Record "Item Ledger Entry";
        ItemRegister: Record "Item Register";
        LineNo: Integer;
    begin
        with item do begin
            if not Confirm(Item1, false, "Medicine Code") then
                exit;
            if Post then
                Error(item2, "Medicine Code");
            HospSetup.Get();
            HospSetup.TestField("Item Journal Batch");
            HospSetup.TestField("Item Journal Template");
            item.TestField("Medicine Code");
            item.TestField(Quantity);


            JnlBatch.Init();
            JnlBatch."Journal Template Name" := HospSetup."Item Journal Template";
            JnlBatch.Name := "Medicine Code";
            if not JnlBatch.Get(HospSetup."Item Journal Template", "Medicine Code") then
                JnlBatch.Insert();

            Itmjnline.Init();
            Itmjnline."Journal Template Name" := JnlBatch."Journal Template Name";
            Itmjnline."Journal Batch Name" := JnlBatch.Name;
            Itmjnline."Posting Date" := "Receive Date";
            Itmjnline."Item No." := "Medicine Code";
            Itmjnline."Document No." := "Medicine Code";
            Itmjnline."Gen. Prod. Posting Group" := HospSetup."Gen. Prod. Posting Group";
            Itmjnline."Gen. Bus. Posting Group" := HospSetup."Gen. Bus. Posting Group";
            Itmjnline."Inventory Posting Group" := HospSetup."Inventory Posting Group";
            Itmjnline."Location Code" := HospSetup."Location Code";
            Itmjnline.Quantity := Quantity;
            Itmjnline.Validate(Quantity);
            Itmjnline.Insert();

            Itmjnline.Reset();
            Itmjnline.SetRange("Journal Template Name", HospSetup."Item Journal Template");
            Itmjnline.SetRange("Journal Batch Name", "Medicine Code");
            Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", Itmjnline);

            ItemRegister.Reset();
            ItemRegister.SetRange("Journal Batch Name", "Medicine Code");
            if ItemRegister.Find('-') then begin
                Post := true;
                Modify();
                
                itemldgr.Reset();
                itemldgr.SetRange("Document No.", item."Medicine Code");
                if itemldgr.FindSet() then begin
                    itemldgr."Document Type" := itemldgr."Document Type"::"Direct Transfer";
                    itemldgr.Modify();
                end;
            end;
        end;
    end;
}