import 'package:pro27/Screens/splashScreen.dart';
import 'package:flutter/material.dart';



class splashscreen extends StatefulWidget {
  final Widget? child;
  const splashscreen({super.key, this.child});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  void initState(){
    Future.delayed(
        Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>welcomeScreen()));
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey[700],
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        child: Container(
          height: MediaQuery.of(context).size.height*5,
          width: MediaQuery.of(context).size.width*1,
          child: Image.asset(
            "assets/Gts.gif",
            // height: MediaQuery.of(context).size.height/1,
            // width: MediaQuery.of(context).size.width/1,
            fit: BoxFit.contain ,
          ),
        ),
      ),
    );
  }
}
