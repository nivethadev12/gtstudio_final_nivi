import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../ApiModel/AuthorDataGetModel.dart';
import '../ApiModel/CategoryGetModel.dart';
import '/Screens/podcastPlayer.dart';
import '../ApiModel/AudioGetModel.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'Settings/notification.dart';
import 'audioList.dart';
import 'authorProfile.dart';
import 'categoryList.dart';
import 'package:card_swiper/card_swiper.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<AudioGet>> _audioFuture;


  Future<List<AudioGet>> AudioGetApi() async{
    var homeResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/audiouploadmasterget"));
    var audioData =jsonDecode(homeResponse.body);
    print(audioData);
    return (audioData as List).map((e) => AudioGet.fromJson(e)).toList();
  }
  Future<List<CategoryGet>> CategoryGetApi() async {
    var audioResponse =
    await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/categorymasterget"));
    var audioData = jsonDecode(audioResponse.body);
    return (audioData as List).map((e) => CategoryGet.fromJson(e)).toList();
  }

  Future<List<AuthorGet>> CategoryAuthorGetApi() async{
    var authorListResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/authormasterget"));
    var authorListData =jsonDecode(authorListResponse.body);
    return (authorListData as List).map((e) => AuthorGet.fromJson(e)).toList();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioFuture = AudioGetApi();
    CategoryGetApi();
    CategoryAuthorGetApi();

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
              children: [
                //header
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi Buddy !",style: homePageHeading,),
                            Expanded(
                                flex: 2,
                                child: Text("Have a great by hearing the interesting podcast ",style: homeSubHeading))
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>notification()));
                          },
                            child: Icon(Icons.notifications,size: 30,color: Colors.white,))
                      ],
                    ),
                  ),
                ),
                //top carousel
                FutureBuilder(
                  future: CategoryGetApi(),
                  builder: (BuildContext context,snapshot) {
                    if(snapshot.hasData) {
                      List<CategoryGet> list = snapshot.data!;
                      return
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height*0.23,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 400),
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: 5,
                          itemBuilder: (BuildContext context , int index, int realIndex){

                            return Stack(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryList(categoryHead: snapshot
                                                      .data![index].categoryName
                                                      .toString())));
                                    },
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          // color:Colors.lightBlue,
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage("https://podcastapp.gtcollege.in/api${snapshot
                                                  .data![index]
                                                  .categoryImage}"),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom:10,
                                      right:20,
                                      child: GestureDetector(
                                          onTap:(){
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoryList(categoryHead: snapshot
                                                            .data![index].categoryName
                                                            .toString())));
                                          },
                                          child: Icon(Icons.play_circle,color: textColor,size: 30,))
                                  )
                                ]
                            );
                          },
                        );
                    }
                    else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      //recommended list
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future: CategoryAuthorGetApi(),
                          builder: (BuildContext context,snapshot) {
                            if(snapshot.hasData) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Recommended Author", style: sideHeading,)
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context)=>CategoryList(categoryHead: '',)));
                                        },
                                        child: Row(
                                          children: [
                                            Text("See all",style: sideHeading,),
                                            SizedBox(width: 10),
                                            Icon(Icons.arrow_circle_right_outlined,color: textColor,)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height*0.12,
                                  //   child:
                                  //   ListView.builder(
                                  //       scrollDirection: Axis.horizontal,
                                  //       itemCount: snapshot.data!.length,
                                  //       itemBuilder: (BuildContext con,index)
                                  //       {
                                  //         return
                                  //           GestureDetector(
                                  //             onTap:(){
                                  //               Navigator.of(context).push(MaterialPageRoute(
                                  //                   builder: (context)=>AuthorProfile(
                                  //                     authorId: snapshot.data![index].sId.toString(),
                                  //               )));
                                  //             },
                                  //             child: Padding(
                                  //               padding: const EdgeInsets.only(right: 25),
                                  //               child: Container(
                                  //                 height: MediaQuery.of(context).size.height*0.1,
                                  //                 width: MediaQuery.of(context).size.width*0.2,
                                  //                 decoration: BoxDecoration(
                                  //                   shape: BoxShape.circle,
                                  //                   //borderRadius: BorderRadius.circular(25),
                                  //                   // boxShadow: [
                                  //                   //   BoxShadow(
                                  //                   //     color: Colors.white38 ,
                                  //                   //     blurRadius: 5,
                                  //                   //     spreadRadius: 2,
                                  //                   //     offset: Offset(
                                  //                   //         2.0,
                                  //                   //         2.0
                                  //                   //     ),
                                  //                   //   )
                                  //                   // ],
                                  //                   image: DecorationImage(
                                  //                     image: NetworkImage("https://podcastapp.gtcollege.in/api${snapshot.data![index].authorProfilePicture}"),
                                  //                     fit: BoxFit.fitWidth,
                                  //                   ),
                                  //                   // color: Colors.cyan,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           );
                                  //       }
                                  //   ),
                                  // ),



                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 270,
                                          //height: MediaQuery.of(context).size.height * .15,
                                          width: MediaQuery.of(context).size.width *1,
                                          color: Color(0xff0f0617),
                                          child:
                                          GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              mainAxisSpacing: 3,
                                              crossAxisSpacing: 10,
                                            ),
                                            padding: EdgeInsets.all(10),
                                            itemCount: snapshot.data!.length,
                                            //sscrollDirection: Axis.horizontal,
                                            itemBuilder: (context,index) {
                                              return Container(
                                                height: 5,
                                        
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width:  200,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage("https://podcastapp.gtcollege.in/api${snapshot.data![index].authorProfilePicture}"),
                                                        fit: BoxFit.fill),
                                                      ),
                                                    ),
                                        
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),



                                ],
                              );
                            }
                            else if (snapshot.hasError){
                              return Text("${snapshot.error}");
                            }
                            return Shimmer.fromColors(
                                baseColor: Colors.grey[500]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.15,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 9,
                                      itemBuilder: (BuildContext context, int index){
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.2,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                )

                            );
                          },

                        ),
                      ),
                      //trending list

                      // technology

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: _audioFuture,
                    builder: (BuildContext context,snapshot) {
                      if(snapshot.hasData) {
                        List<AudioGet> list = snapshot.data!;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Recently Played", style: sideHeading,)
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context)=>audioList()));
                                  },
                                  child: Row(
                                    children: [
                                      Text("See all",style: sideHeading,),
                                      SizedBox(width: 10),
                                      Icon(Icons.arrow_circle_right_outlined,color: textColor,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),

                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.95,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.6,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                  ),
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 1),
                                      child: GestureDetector(
                                        onTap:(){
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) => PodcastPlayer(songId: list[index].sId)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.15,
                                            width: MediaQuery.of(context).size.width*0.35,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(13),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: Colors.black54,
                                              //     blurRadius: 5,
                                              //     spreadRadius: 2,
                                              //     offset: Offset(
                                              //         5.0,
                                              //         5.0
                                              //     ),
                                              //   )
                                              // ],
                                              image: DecorationImage(
                                                image: NetworkImage("https://podcastapp.gtcollege.in/api${list[index].banner.toString()}"),
                                                fit: BoxFit.cover,
                                              ),
                                              // color: Colors.cyan,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        );
                      }
                      else if (snapshot.hasError){
                        return Text("${snapshot.error}");
                      }
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.4,
                              child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.6,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                  ),
                                  itemCount: 6,
                                  itemBuilder: (BuildContext context, int index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.15,
                                        width: MediaQuery.of(context).size.width*0.35,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                              ),
                            ),
                          )

                      );
                    },

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
