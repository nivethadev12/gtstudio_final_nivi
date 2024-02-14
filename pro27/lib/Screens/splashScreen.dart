import 'package:flutter/material.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'language.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.black,
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4 ,
                width: MediaQuery.of(context).size.width*0.7,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Gt.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 50,),
              Text("Welcome to the vibrant world of GT Podcasts, where our interns and developers share their insights, experiences, and the latest in tech. Get ready for a journey through innovation and expertise!",
                style: welcome_,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 60,),

              MaterialButton(
                height: MediaQuery.of(context).size.height*0.06,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                color:button,
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Language()), (route) => false);
                },
                child: Text("Get Started",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
              ),

              SizedBox(height: 35,),
            ],
          ),
        ),
      ),
    );
  }
}
