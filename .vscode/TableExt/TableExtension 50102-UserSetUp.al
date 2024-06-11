tableextension 50102 user extends "User Setup"
{
    fields
    {
        field(5010;"Triage"; Boolean)
        {
            Caption = 'Triage';
            DataClassification = CustomerContent;
        }
        field(5011;"Reception"; Boolean)
        {
            Caption = 'Reception';
            DataClassification = CustomerContent;
        }
        field(5012;"Doctor"; Boolean)
        {
            Caption = 'Doctor';
            DataClassification = CustomerContent;
        }
        field (5013;"Finance"; Boolean)
        {
            Caption= 'Finance';
            DataClassification = CustomerContent;
        }
        field(5014;"Pharmacy"; Boolean)
        {
            Caption = 'Pharmacy';
            DataClassification = CustomerContent;
        }
        field(5015;"Laboratory"; Boolean)
        {
            Caption= 'Laboratory';
            DataClassification = CustomerContent;
        }
        
      
    }
    
    
}