// page 60132 "Pharmacy Role Center"
// {
//     PageType = RoleCenter;
//     Caption = 'RoleCenter';

//     layout
//     {
//         area(RoleCenter)
//         {
//             group(triage)
//             {
//                 part(headline; "Headline RC Administrator")
//                 {
//                     ApplicationArea = Basic, suite;
//                 }
//             }

//             group(GroupRole2)
//             {

//             }
//         }
//     }
//     actions
//     {
//         area(Sections)
//         {
//             group(sections0)
//             {

//                 Caption = 'PHARMACY';
//                 action("Issue Drugs")
//                 {
//                     RunObject = page "Patients List";
//                     Image = Customer;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Patients List';
//                 }
//             }
//         }
//     }
// }
// profile Hospital3
// {
//     ProfileDescription = 'Hospital3';
//     RoleCenter = "Pharmacy Role Center";
//     Caption = 'Pharmacy Role Center';
// }

