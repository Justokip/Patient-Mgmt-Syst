// page 60146 "Finance Hospital Role Center"
// {
//     Caption = 'RoleCenter';
//     PageType = RoleCenter;


//     layout
//     {
//         area(RoleCenter)
//         {
//             group(group1)
//             {
//                 part(headline; "Headline RC Administrator")
//                 {
//                     ApplicationArea = Basic, suite;
//                 }
//             }
//             group(groupRole)
//             {

//             }
//         }
//     }
//     actions
//     {
//         area(Sections)

//         {
//             group(Section2)
//             {
//                 Caption = 'FINANCE';
//                 action(Payment)
//                 {
//                     RunObject = page "Patient Invoice List";
//                     Image = Customer;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Patient Invoice List';
//                 }
//                 action(Payment1)
//                 {
//                     RunObject = page "Charges List";
//                     ApplicationArea = all;
//                     Caption = 'Charges List';
//                 }
//             }
//         }
//     }
// }


// profile Hospital1
// {
//     ProfileDescription = 'Hospital1';
//     RoleCenter = "Finance Hospital Role Center";
//     Caption = 'Hospital Finance Management';
// }
