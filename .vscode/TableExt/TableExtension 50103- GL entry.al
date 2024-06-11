tableextension 50103 CustomerEntry extends "Cust. Ledger Entry"
{
    fields
    {
        field(1201;"Customer Type";Enum "Customer Type")
        {
            Caption= 'Customer Type';
            DataClassification = CustomerContent;
        }
    }
    
    
}