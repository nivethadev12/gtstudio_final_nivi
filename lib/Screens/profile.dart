import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../main.dart';
import '../textstyle.dart';
import 'Settings/about.dart';
import 'Settings/audioLanguage.dart';
import 'Settings/audioQuality.dart';
import 'Settings/dataSaver.dart';
import 'Settings/notification.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  Uint8List? _image;
  File? selectedIMage;

  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black54,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Gallery",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Camera",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }




  bool isfollowe = false;


  int _counter = 0;

  void _isfollowe (bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _counter++;
      } else {
        _counter--;
      }
    });
  }








  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1,gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  // backgroundImage: CircleAvatar(child: Image(image: ,),),
                  radius: 60,
                  child: Image(image: AssetImage("assets/Gt.png"),fit: BoxFit.fill,),
                ),

                // Stack(
                //   children: [
                //     _image != null
                //         ? CircleAvatar(
                //         radius: 60,
                //         backgroundImage: MemoryImage(_image!))
                //         : const CircleAvatar(
                //       radius: 60,
                //       backgroundImage: NetworkImage(
                //           "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
                //     ),
                //
                //     Positioned(
                //         bottom: -10,
                //         left: 80,
                //         child: IconButton(
                //             onPressed: () {
                //               showImagePickerOption(context);
                //             },
                //             icon:  Icon(Icons.add_a_photo,
                //               color: Colors.grey.shade600,
                //               size: 30,
                //             )))
                //   ],
                // ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // ListTile(
                    //   leading: Icon(Icons.settings_outlined, color:textColor,),
                    //   title: Text("General Settings", style: profileListTile),
                    //   trailing: Icon(Icons.arrow_forward_ios, color: textColor),
                    // ),

                    // InkWell(
                    //   onTap:(){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataSaver()));
                    //   } ,
                    //   child: ListTile(
                    //     leading: Icon(Icons.language_outlined, color:textColor),
                    //     title: Text("Data saver", style: profileListTile),
                    //     trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap:(){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => AudioLanguages()));
                    //   } ,
                    //   child: ListTile(
                    //     leading: Icon(Icons.music_note, color:textColor),
                    //     title: Text("Audio Language", style: profileListTile),
                    //     trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => AudioQuality()));
                    //   },
                    //   child: ListTile(
                    //     leading: Icon(Icons.multitrack_audio, color:textColor),
                    //     title: Text("Audio Quality", style: profileListTile),
                    //     trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    //   ),
                    // ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => notification()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.notifications_active, color:textColor),
                        title: Text("Notification", style: profileListTile),
                        trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                      ),
                    ),

                    // ListTile(
                    //   leading: Icon(Icons.privacy_tip_outlined, color:textColor),
                    //   title: Text("Privacy & Policy", style: profileListTile),
                    //   trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    // ),

                    // ListTile(
                    //   leading: Icon(Icons.help_outline_sharp, color:textColor),
                    //   title: Text("Help Center", style: profileListTile),
                    //   trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    // ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.info_outline, color:textColor),
                        title: Text("About", style: profileListTile),
                        trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                      ),
                    ),


                    InkWell(
                      onTap: () {
                      },
                      child: ListTile(
                        leading: Icon(Icons.person, color: textColor),
                        title: Text("Following", style: profileListTile,),
                        // trailing: Consumer<Counter>(
                        //   builder: (context, counter, child) => Text(
                        //     '${counter.count}',
                        //
                        //     style: TextStyle(color: textColor,fontSize: 25),
                        //   ),
                        // ),
                      ),
                    ),




                    // InkWell(
                    //   onTap: (){
                    //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (route) => false);
                    //   },
                    //   child: ListTile(
                    //     leading: Icon(Icons.logout_outlined, color:textColor),
                    //     title: Text("Logout", style: profileListTile),
                    //   ),
                    // ),
                    // InkWell(
                    //   // onTap: (){
                    //   //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (route) => false);
                    //   // },
                    //   child: ListTile(
                    //     leading: Icon(Icons.person, color:textColor),
                    //     title: Text("Following", style: profileListTile),
                    //     trailing: Icon(Icons.arrow_forward_ios, color: textColor,),
                    //   ),
                    // ),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}