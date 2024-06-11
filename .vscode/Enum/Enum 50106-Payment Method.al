enum 50106 "Payment Method"
{
    Extensible = true;

    value(0; select)
    {
        Caption = 'Select';
    }
    value(1; "Bank account")
    {
        Caption = 'Bank account';
    }
    value(2; "Medical Cover")
    {
        Caption = 'Medical Cover';
    }
    value(3; Cash)
    {
        Caption = 'Cash';
    }

}