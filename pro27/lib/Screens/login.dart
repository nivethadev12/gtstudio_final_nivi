import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../textstyle.dart';
import 'language.dart';
import 'otpVerification.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String verify="";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryCodeController.text = "+91";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white24,
                    //Color(0xff2F2D30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Language()), (route) => false);
                  }, child: Text("Skip",
              style: homePage_Heading,
              )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.width*1,

            decoration: BoxDecoration(
             color: Color(0xff1e1f1a)
            ),

            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 200,
                      spreadRadius: .50,
                      offset: Offset(10, 10),
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: homePage_Heading
                        ),

                        Text(
                          "Hi! Please login to hear the podcast ",
                          style: sideHeading
                        ),
                      ],
                    ),


                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  countryCodeController.text = value;
                                });
                              },
                              controller: countryCodeController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(fontSize: 33, color: Colors.grey),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone",
                                hintStyle: sideHeading
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white24,
                              //Color(0xff2F2D30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: "${countryCodeController.text + phoneController.text}",
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {},
                                codeSent: (String verificationId, int? resendToken) {
                                  Login.verify=verificationId;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  OtpVerification(phoneNo: phoneController.text,)),
                                  );
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );
                            },
                            child: Text("Get OTP", style: sideHeading
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}



