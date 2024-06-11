pageextension 50101 user extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {

            field(Reception; Rec.Reception)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reception field.';
                
            }
            field(Triage; Rec.Triage)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Triage field.';
            }
            field(Doctor; Rec.Doctor)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Doctor field.';
            }
            field(Finance; Rec.Finance)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Finance field.';
            }
            field(Laboratory; Rec.Laboratory)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Laboratory field.';
            }
            field(Pharmacy; Rec.Pharmacy)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pharmacy field.';
            }
        }
    }
}