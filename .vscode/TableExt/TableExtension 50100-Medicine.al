tableextension 50100 Items extends Item
{
    fields
    {
        field(99008501; "Medicine Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Pharmaceutical Code';

        }
        field(99008502; "Medicine Type"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Items Type';
        }
        field(99008503; "Medicine Category"; option)
        {
            OptionMembers = Item,Medicine;
            OptionCaption = 'Item, Medicine';
            DataClassification = CustomerContent;
        }
        field(99008504; "Receive Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Receive Date';
        }
        field(99008505; "Serial Number"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial Number';
        }
        field(99008506; "Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiry Date';
        }
        field(99008507; "Manufacturing Date"; Date)
        {
            Caption = 'Manufacturing Date';
            DataClassification = CustomerContent;
        }

        field(99008509; "Manufacturing company"; text[50])
        {
            Caption = 'Manufacturing Company';
            DataClassification = CustomerContent;
        }
        field(99008511; Post; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }

    }


}