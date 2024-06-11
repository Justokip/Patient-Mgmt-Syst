codeunit 50100 "Documentation Released1"
{
    procedure CreateItems(var HospItems: Record "Hosp Received Items")
    var
        itm: Record Item;
        medicine: Record "Hospital Setup";
        ItemLedEntry: Record "Item Ledger Entry";
    begin
        medicine.Get();
        itm.Init();
        itm.TransferFields(HospItems);
        itm."Medicine Category" := itm."Medicine Category"::Medicine;
        itm."Gen. Prod. Posting Group" := medicine."Gen. Prod. Posting Group";
        itm."VAT Prod. Posting Group" := medicine."VAT Prod. Posting Group";
        itm."Inventory Posting Group" := medicine."Inventory Posting Group";
        itm."Unit Cost" := HospItems."Unit Price";
        itm.Insert();
    end;

    procedure HospitemsApproved(var Hospitems: Record "Hosp Received Items")
    var
        ItemsExist: Record "Hosp Received Items";
    begin
        ItemsExist.Reset();
        ItemsExist.SetRange("Medicine Code", Hospitems."Medicine Code");
        if ItemsExist.FindFirst() then begin
            ItemsExist."Status" := ItemsExist."Status"::"Approved";
            ItemsExist.Modify();
            CreateItems(ItemsExist);
        end;
    end;
    procedure HospitemsCanceled(var Hospitems: Record "Hosp Received Items")
    var
        ItemsExist: Record "Hosp Received Items";
    begin
        ItemsExist.Reset();
        ItemsExist.SetRange("Medicine Code", Hospitems."Medicine Code");
        if ItemsExist.FindFirst() then begin
            ItemsExist."Status" := ItemsExist."Status"::Canceled;
            ItemsExist.Modify();
            CreateItems(ItemsExist);
        end;
    end;

    procedure HospItemsReopen(var Hospitems: Record "Hosp Received Items")
    var
        ItemsExist: Record "Hosp Received Items";
    begin
        Hospitems."Status" := Hospitems."Status"::Open;
        Hospitems.Modify();
    end;

}


