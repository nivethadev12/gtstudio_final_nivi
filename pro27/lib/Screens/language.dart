import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../ApiModel/LanguageGet.dart';
import '/Screens/bottomNavigation.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  Set<int> selectedIndices = {};
  bool isLanguageSelected = false;
  late Future<List<LanguageGet>> languageData;

  Future<List<LanguageGet>> LanguageGetApi() async {
    var languageResponse =
    await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/languagemasterget"));
    var audioData = jsonDecode(languageResponse.body);
    return (audioData as List).map((e) => LanguageGet.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    languageData = LanguageGetApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1, gradient2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("We Are Providing :", style: TextStyle(color: Colors.white,fontSize: 19)),
                  ],
                ),
                SizedBox(height: 20),

                Container(
                  height: MediaQuery.of(context).size.height * 0.71,
                  width: MediaQuery.of(context).size.width * 1,

                  child: FutureBuilder(
                    future: languageData,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.6,
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 10.0,
                            ),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.12,
                                    width: MediaQuery.of(context).size.width * 0.46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 150,
                                          spreadRadius: .50,
                                          offset: Offset(10, 10),
                                        )
                                      ],
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 10),


                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: snapshot.hasData ? snapshot.data?.length : 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.12,
                                    width: MediaQuery.of(context).size.width * 0.46,
                                    //color: Colors.green,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 3,
                                        color: selectedIndices.contains(index)
                                            ? button
                                            : Colors.black,
                                      ),
                                      //   image: DecorationImage(
                                      //       image: NetworkImage(
                                      //           "http://podcast.gtgym.in/api${snapshot.data?[index].languageImage}"
                                      //       ),
                                      //       fit: BoxFit.fill),
                                      //   color: selectedIndices.contains(index)
                                      //       ? Colors.white
                                      //       : Colors.transparent,
                                    ),

                                    child: Column(
                                      children: [
                                        Container(
                                          // height: 50,
                                          // width: 50,
                                          height: MediaQuery.of(context).size.height * 0.083,
                                          width: MediaQuery.of(context).size.width * 0.46,
                                          //color: Colors.cyanAccent,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight:Radius.circular(20)),
                                            // border: Border.all(
                                            //   width: 3,
                                            //   color: selectedIndices.contains(index)
                                            //       ? button
                                            //       : Colors.black,
                                            // ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://podcastapp.gtcollege.in/api${snapshot.data?[index].languageImage}"),
                                                fit: BoxFit.fill),
                                            color: selectedIndices.contains(index)
                                                ? Colors.white
                                                : Colors.transparent,
                                          ),
                                        ),
                                        //SizedBox(height: 58,),

                                        Container(
                                            height: MediaQuery.of(context).size.height * 0.03,
                                            width: MediaQuery.of(context).size.width * 0.46,

                                            child:ClipRRect(
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaY:10 ,sigmaX: 10),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height * 0.03,
                                                  width: MediaQuery.of(context).size.width * 0.46,
                                                  color: Colors.white.withOpacity(0.2),
                                                  child: Stack(
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          snapshot.data![index].languageName.toString(),
                                                          style: sideHeading,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                              ),
                                            )

                                        ),

                                      ],
                                    )

                                ),
                                // SizedBox(height: 10),

                                // Text(
                                //   snapshot.data![index].languageName.toString(),
                                //   style: sideHeading,
                                // )
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),






                // if (isLanguageSelected)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => BottomNavigation()),
                            (route) => false,
                      );
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
