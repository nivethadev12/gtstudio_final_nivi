import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import '../../textstyle.dart';


class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },

            child: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
        title: Text("Notification",
        style: TextStyle(color: Colors.white),),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image(
          //   image: AssetImage("assets/Untitled design (1).jpg"),
          // ),
          Center(child: Text("No Data Found",style: homePageHeading,))
        ],
      ),
    );
  }
}
