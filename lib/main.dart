import 'package:flutter/material.dart';

import 'main_screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(),
    );
  }
}




//





// Row(
//   children: [
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4),
//       child: SizedBox(
//         width: 35,
//         child: ListView.builder(
//             controller: _firstController,
//             shrinkWrap: true,
//             itemCount: 20,
//             itemBuilder: ((context, index) {
//               return
//             })),
//       ),
//     ),
//     SizedBox(
//       width: 349,
//       child: ListView.builder(
//           controller: _secondController,
//           shrinkWrap: true,
//           itemCount: 20,
//           itemBuilder: ((context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: SizedBox(
//                       width: 349,
//                       height: 200,
//                       child: Image.asset(
//                         'assets/images/silent_sea.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             'INVENTING',
//                             style: GoogleFonts.gideonRoman(
//                                 color: commonWhite, fontSize: 25),
//                           ),
//                           Text(
//                             'ANNA',
//                             style: GoogleFonts.gideonRoman(
//                                 color: commonWhite, fontSize: 35),
//                           )
//                         ],
//                       ),
//                       const Spacer(),
//                       const NavBarItem(
//                         iconData: Icons.notifications_none_outlined,
//                         text: 'Remind Me',
//                         iconColor: commonWhite,
//                         weight: FontWeight.normal,
//                         color: Colors.grey,
//                         size: 12,
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       const NavBarItem(
//                         iconData: Icons.info_outline,
//                         text: 'Info',
//                         iconColor: commonWhite,
//                         weight: FontWeight.normal,
//                         color: Colors.grey,
//                         size: 12,
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       )
//                     ],
//                   ),
//                   customText(text: 'Limited Series coming on Friday'),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   customText(
//                       text: 'Inventing Anna', weight: FontWeight.bold),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   customText(
//                     color: Colors.grey,
//                       text:
//                           "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
//                  customText(text: 'scandalous  Drama  Journalism  Fraud  Rags to Riches  Con Game'),
//                 ],
//               ),
//             );
//           })),
//     ),
//   ],
// )