import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../textstyle.dart';

class DataSaver extends StatefulWidget {
  const DataSaver({super.key});

  @override
  State<DataSaver> createState() => _DataSaverState();
}

class _DataSaverState extends State<DataSaver> {
  bool light = true;
  bool light1 = false;
  bool light2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1e1f1a),
            leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
                child: Icon(Icons.arrow_back,color: Colors.white,)
            ),
            title: Text('Data Saver',style: homePageHeading
            ),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height*1,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
               color: Color(0xff1e1f1a)
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Data Saver',
                          style: homePageHeading,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),),
                            CupertinoSwitch(
                                value: light,
                                onChanged: (bool value){
                                  setState(() {
                                    light = value;
                                  });
                                }),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Text("Video Podcasts",style:
                        homePageHeading
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Download audio only",style:
                        homePage_Heading
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),)
                              ],
                            ),
                            Row(
                              children: [
                                CupertinoSwitch(value: light1,
                                    onChanged: (bool value){
                                      setState(() {
                                        light1 = value;
                                      });
                                    })
                              ],
                            ),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Text("Stream audio only",style:
                        homePage_Heading                        )
                      ],
                    ),
                    SizedBox(
                  height: 100,
                  width: 400,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),)
                          ],
                        ),
                        Row(
                          children: [
                            CupertinoSwitch(
                                value: light2,
                                onChanged: (bool value){
                                  setState(() {
                                    light2 = value;
                                  });
                                })
                          ],
                        ),
                      ]
                  ),
                ),
                  ],
                ),
              )
          ),
        )
    );
  }
}