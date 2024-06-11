// page 60131 "Reception Role Center"
// {
//     PageType = RoleCenter;
//     Caption = 'RoleCenter';

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
//             group(grouRole)
//             {

//             }
//         }
//     }
//     actions
//     {
//         area(Sections)
//         {
//             group(Section)
//             {
//                 Caption = 'RECEPTION';

//             }
//             group(Section1)
//             {
//                 Caption = 'TRIAGE';
//                 action("Test")
//                 {
//                     RunObject = page "Triage List";
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Triage List';
//                 }
//             }
//         }

//     }
// }
// profile Hospital2
// {
//     ProfileDescription = 'Hospital2';
//     RoleCenter = "Reception Role Center";
//     Caption = 'Reception Role Center';
// }
