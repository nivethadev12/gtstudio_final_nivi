import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pro27/Screens/splashScreen.dart';
import 'package:flutter/material.dart';



class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splashIconSize: 500,
        splash: Column(
          children: [
            Image.asset('assets/Gt.png',fit: BoxFit.fill,
            ),
            Text("GTStudio",
              style: TextStyle(color: Colors.white,fontSize: 50,fontFamily: "Outfit-SemiBold",fontWeight: FontWeight.bold),
            )
          ],
        ),
        nextScreen: welcomeScreen(),
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
