// // import 'package:ar_fina_gt/Screens/audioList.dart';
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// //
// //
// // import '../../colors.dart';
// // import '../../textstyle.dart';
// //
// // class About extends StatefulWidget {
// //   const About({super.key});
// //
// //   void  _launchURL(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }
// //
// //
// //
// //
// //
// //
// //
// //   @override
// //   State<About> createState() => _AboutState();
// // }
// //
// // class _AboutState extends State<About> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Container(
// //           padding: EdgeInsets.all(10),
// //           height: double.infinity,
// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //            color: Color(0xff1e1f1a)
// //           ),
// //           child: Column(
// //             children: [
// //               SizedBox(height: 10),
// //               InkWell(
// //                 onTap: (){
// //                   Navigator.pop(context);
// //                 },
// //                 child: Align(
// //                     alignment: Alignment.topLeft,
// //                     child: Icon(Icons.arrow_back,color: Colors.white,)),
// //               ),
// //               Text("About",
// //                 style: homePageHeading,
// //               ),
// //               SizedBox(height: 40,),
// //               CircleAvatar(
// //                 child: Image(image: AssetImage("assets/Gt.png"),),
// //                 radius: 50,
// //                 backgroundColor: Colors.white,
// //               ),
// //               SizedBox(height: 10),
// //               Text("Podcast",
// //                 style: categoryCardText,
// //               ),
// //               SizedBox(height: 5),
// //               Text("Version 2.0125",
// //                 style: categoryCardText,
// //               ),
// //               // Divider(
// //               //   height: 60,
// //               //   thickness: 0.5,
// //               //   color: Colors.grey,
// //               // ),
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Rate us",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Share to friends",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //               Divider(
// //                 height: 60,
// //                 thickness: 0.5,
// //                 color: Colors.grey,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text("Instagram",
// //                     style: categoryCardText,
// //                   ),
// //                   TextButton(
// //                     onPressed: (){
// //                       _launchURL('https://www.google.com');
// //                     },
// //                     child: Text("gtsutdio",
// //                     style: TextStyle(
// //                         fontSize: 16,color: Colors.white54
// //                     ),
// //                   ),)
// //
// //                 ],
// //               ),
// //               // SizedBox(height: 20),
// //               // Row(
// //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               //   children: [
// //               //     Text("Twitter",
// //               //       style: categoryCardText,
// //               //     ),
// //               //     Text("@podcast",
// //               //       style: TextStyle(
// //               //           fontSize: 16,color: Colors.white54
// //               //       ),
// //               //     )
// //               //   ],
// //               // ),
// //               // SizedBox(height: 20),
// //               // Row(
// //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               //   children: [
// //               //     Text("Facebook",
// //               //       style: categoryCardText,
// //               //     ),
// //               //     Text("podcast.facebook",
// //               //       style: TextStyle(
// //               //           fontSize: 16,color: Colors.white54
// //               //       ),
// //               //     )
// //               //   ],
// //               // ),
// //               // Divider(
// //               //   height: 60,
// //               //   thickness: 0.5,
// //               //   color: Colors.grey,
// //               // ),
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Contact us",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //               // SizedBox(height: 20),
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Privacy & policy",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //               // SizedBox(height: 20),
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Terms & Conditions",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //               // SizedBox(height: 20),
// //               // Align(
// //               //   alignment: Alignment.topLeft,
// //               //   child: Text("Report an issue",
// //               //     style: categoryCardText,
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../../colors.dart';
// import '../../textstyle.dart';
// // import 'audioList.dart'; // Make sure to import the necessary file
//
// class About extends StatelessWidget {
//   const About({Key? key}) : super(key: key);
//
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Color(0xff1e1f1a),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//               ),
//               Text(
//                 "About",
//                 style: homePageHeading,
//               ),
//               SizedBox(height: 40),
//               CircleAvatar(
//                 child: Image(image: AssetImage("assets/Gt.png")),
//                 radius: 50,
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "Podcast",
//                 style: categoryCardText,
//               ),
//               SizedBox(height: 5),
//               Text(
//                 "Version 2.0125",
//                 style: categoryCardText,
//               ),
//               Divider(
//                 height: 60,
//                 thickness: 0.5,
//                 color: Colors.grey,
//               ),
//
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "Sharing Option",
//                         style: categoryCardText,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       Text(
//                         "Share Your Friend's",
//                         style: categoryCardText,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Replace 'Hello, world!' with the content you want to share.
//                           Share.share('Hello, world!');
//                         },
//                         child: Text('Share'),
//                       ),
//                       // TextButton(
//                       //   onPressed: () {
//                       //     Share.share('Hello, world!');
//                       //
//                       //   },
//                       //   child: Text(
//                       //     "share",
//                       //     style: TextStyle(
//                       //       fontSize: 16,
//                       //       color: Colors.white54,
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   Divider(
//                     height: 60,
//                     thickness: 0.5,
//                     color: Colors.grey,
//                   ),
//                 ],
//               ),
//
//
//
//               Row(
//                 children: [
//                   Text(
//                     "Instagram",
//                     style: categoryCardText,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   Text(
//                     "Instagram",
//                     style: categoryCardText,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       _launchURL('https://www.instagram.com/gtstudio__?igsh=dnY2aXoxcjVxMW83');
//                     },
//                     child: Text(
//                       "gtsutdio",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white54,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 height: 60,
//                 thickness: 0.5,
//                 color: Colors.grey,
//               ),
//               // Add more rows for other social media links if needed
//
//               // Optionally add more sections like "Contact us," "Privacy & policy," etc.
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../colors.dart';
import '../../textstyle.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff1e1f1a),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Text(
                "About",
                style: homePageHeading,
              ),
              SizedBox(height: 40),
              CircleAvatar(
                child: Image(image: AssetImage("assets/Gt.png")),
                radius: 50,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                "Podcast",
                style: categoryCardText,
              ),
              SizedBox(height: 5),
              Text(
                "Version 2.0125",
                style: categoryCardText,
              ),
              Divider(
                height: 60,
                thickness: 0.5,
                color: Colors.grey,
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Sharing Option",
                        style: categoryCardText,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Share",
                        style: categoryCardText,
                      ),
                      TextButton(
                        onPressed: () {
                          Share.share('https://play.google.com/store/apps/details?id=com.gtsoftwares.gtpodcast ');
                        },
                        child: Text('Share',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white54,
                          ),),
                      ),

                    ],
                  ),
                  Divider(
                    height: 60,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    "Social Media",
                    style: categoryCardText,
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instagram",
                    style: categoryCardText,
                  ),
                  TextButton(
                    onPressed: () {
                      _launchURL('https://www.instagram.com/gtstudio__?igsh=dnY2aXoxcjVxMW83');
                    },
                    child: Text(
                      "gtsutdio",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 60,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
