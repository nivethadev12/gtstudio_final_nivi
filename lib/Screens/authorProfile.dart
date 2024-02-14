import 'dart:convert';
import 'package:pro27/Screens/podcastPlayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



import 'package:shimmer/shimmer.dart';
import '../ApiModel/AudioGetByAuthorId.dart';
import '../ApiModel/AudioGetModel.dart';
import '../ApiModel/AuthorByIdModel.dart';
import '../ApiModel/AuthorDataGetModel.dart';
import '../colors.dart';
import '../main.dart';
import '../textstyle.dart';

class AuthorProfile extends StatefulWidget {
  final String authorId;
  _AuthorProfileState  createState() => _AuthorProfileState ();


  const AuthorProfile({super.key, required this.authorId});

  //@override
  //_AuthorProfileState createState() => _AuthorProfileState();




}

class _AuthorProfileState extends State<AuthorProfile> {



  // Future<AuthorGetById> AuthorGetApi() async {
  //   try {
  //     print(
  //         "${widget.authorId}"
  //     );
  //     var homeResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/authormastergetbyid/${widget.authorId}"));
  //     print("abcde - Status code: ${homeResponse.statusCode}");
  //
  //     if (homeResponse.statusCode == 200) {
  //       var authorData = homeResponse.body;
  //
  //       print("Author data: $authorData");
  //
  //       try {
  //         // Try to parse the JSON string
  //         var decodedData = jsonDecode(authorData);
  //
  //         if (decodedData is List<dynamic>) {
  //           // Assuming the JSON array needs to be handled differently
  //           // Adapt this part according to your data model
  //           // For example, if you expect the first item in the array to be the AuthorGetById data:
  //           if (decodedData.isNotEmpty && decodedData[0] is Map<String, dynamic>) {
  //             return AuthorGetById.fromJson(decodedData[0]);
  //           } else {
  //             print("Unexpected response format. Parsed response: $decodedData");
  //             throw Exception('Unexpected response format');
  //           }
  //         } else if (decodedData is Map<String, dynamic>) {
  //           // Assuming the JSON object has key-value pairs representing AuthorGetById properties
  //           return AuthorGetById.fromJson(decodedData);
  //         } else {
  //           // Handle the case where the parsed response is neither a Map nor a List
  //           print("Unexpected response format. Parsed response: $decodedData");
  //           throw Exception('Unexpected response format');
  //         }
  //       } catch (e) {
  //         // Handle the case where parsing fails
  //         print("Error parsing JSON: $e");
  //         throw Exception('Error parsing JSON');
  //       }
  //     } else {
  //       // Handle the case where the HTTP request fails
  //       print("HTTP request failed with status code: ${homeResponse.statusCode}");
  //       throw Exception('Failed to load author data');
  //     }
  //   } catch (error) {
  //     print("Error: $error");
  //     throw Exception('An error occurred while processing the request');
  //   }
  // }
  //
  Future<List<AuthorGet>> CategoryGetApi() async {
    var authorListResponse = await http.get(Uri.parse(
        "https://podcastapp.gtcollege.in/api/authormastergetbyid/${widget.authorId}"));
    var authorListData = jsonDecode(authorListResponse.body);
    print(authorListData);
    return (authorListData as List).map((e) => AuthorGet.fromJson(e)).toList();
  }

  Future<List<dynamic>> AudioGetApi() async {
    var homeResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/getaudiobyauthorid/${widget.authorId}"));
    var audioData = jsonDecode(homeResponse.body);
    print(audioData);
    return audioData as List<dynamic>;
  }

  // Future<List<AudioGetByAuthorId>> AudioByAuthor() async {
  //   var authorResponse = await http.get(
  //       Uri.parse("http://podcast.gtgym.in/api/audiouploadgetbyauthorid/"));
  //
  //   if (authorResponse.statusCode == 200) {
  //     var authorAudioData = jsonDecode(authorResponse.body);
  //
  //     if (authorAudioData is List) {
  //       return authorAudioData
  //           .map((e) => AudioGetByAuthorId.fromJson(e))
  //           .toList();
  //     } else {
  //       // Handle the case where the response is not a List
  //       throw Exception('Unexpected response format');
  //     }
  //   } else {
  //     // Handle the case where the HTTP request fails
  //     throw Exception('Failed to load audio data');
  //   }
  // }

  // Future<List<AuthorGet>> CategoryGetApi() async{
  //   var authorListResponse = await http.get(Uri.parse("https://podcast.gtgym.in/api/authormasterget"));
  //   var authorListData =jsonDecode(authorListResponse.body);
  //   print(authorListData);
  //   return (authorListData as List).map((e) => AuthorGet.fromJson(e)).toList();
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AuthorGetApi();
    CategoryGetApi();
    AudioGetApi();
    //CategoryGetApi();
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
        // height: double.infinity,
        // width: double.infinity,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.5,
                  floating: false,
                  stretch: true,
                  flexibleSpace: FutureBuilder(
                      future: CategoryGetApi(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          // List<AuthorGetById> lis = snapshot.data!;
                          return FlexibleSpaceBar(
                            centerTitle: false,
                            title: Text(
                              snapshot.data![0].authorName
                                  .toString()
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            background: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://podcastapp.gtcollege.in/api${snapshot.hasData ? snapshot.data![0].authorProfilePicture.toString() : ''}"),
                                      fit: BoxFit.fill)),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                color: Colors.white,
                              )



                              ),
                        );
                      }),
                  leading: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: textColor,
                      )),
                ),
              ];
            },
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradient1, gradient2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Podcasts", style: homePageHeading,),


                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Toggle the follow state
                                  setState(() {
                                    isfollowe = !isfollowe;
                                  });

                                  // You can add additional logic here, such as making an API call to update the follow status on the server.
                                  // For simplicity, let's just print the follow state.
                                  print("User is ${isfollowe ? 'Following' : 'Not Following'}");
                                },

                                child:   AnimatedContainer(


                                  duration: Duration(milliseconds: 300),
                                  height: 30,
                                   width: 150,
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                        color: isfollowe ? Colors.green : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: isfollowe ? Colors.green : Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,),
                                    onPressed: () {
                                      // Provider.of<Counter>(context, listen: false).increment();
                                    },
                                    child:  Row(
                                      children: [
                                        Icon(
                                                  isfollowe ? Icons.check : Icons.add,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  isfollowe ? "Following" : "Follow",
                                                  style: side_Heading,
                                                ),

                                      ],
                                    ),

                                  // child: AnimatedContainer(
                                  //   duration: Duration(milliseconds: 300),
                                  //   height: 30,
                                  //   width: 120,
                                  //   decoration: BoxDecoration(
                                  //     color: isfollowe ? Colors.green : Colors.transparent,
                                  //     borderRadius: BorderRadius.circular(5),
                                  //     border: Border.all(
                                  //       color: isfollowe ? Colors.green : Colors.transparent,
                                  //       width: 1,
                                  //     ),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Icon(
                                  //         isfollowe ? Icons.check : Icons.add,
                                  //         color: Colors.white,
                                  //       ),
                                  //       Text(
                                  //         isfollowe ? "Following" : "Follow",
                                  //         style: side_Heading,
                                  //       ),
                                  //
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),


                      SizedBox(height: 10,),

                      // Text("Aravinth", style: homePageHeading,),


                  // FutureBuilder(
                  //   future: AudioGetApi(),
                  //   builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return CircularProgressIndicator();
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //       return Text('No data available');
                  //     } else {
                  //       List<Map<String, dynamic>> list = snapshot.data!;
                  //       //print(object)
                  //
                  //       return ListView.builder(
                  //         itemCount: list.length,
                  //         itemBuilder: (BuildContext con, int index) {
                  //           Map<String, dynamic> audio = list[index];
                  //           return GestureDetector(
                  //             onTap: () {
                  //               Navigator.of(context).push(
                  //                 MaterialPageRoute(
                  //                   builder: (BuildContext context) => PodcastPlayer(
                  //                     songId: audio['_id'],
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //             child: ListTile(
                  //               leading: Container(
                  //                 height: MediaQuery.of(context).size.height * 0.3,
                  //                 width: MediaQuery.of(context).size.width * 0.2,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   image: DecorationImage(
                  //                     image: NetworkImage(
                  //                       "https://podcastapp.gtcollege.in/api${audio['banner']}",
                  //                     ),
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 ),
                  //               ),
                  //               title: Text(
                  //                 audio['audioTitle'].toString(),
                  //                 style: side_Heading,
                  //               ),
                  //               subtitle: Text(
                  //                 audio['category'].toString(),
                  //                 style: sideHeading,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //   },
                  // ),

                      FutureBuilder(
                          future: AudioGetApi(),
                          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<dynamic> list = snapshot.data!;
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.6,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: list.length,
                                  itemBuilder: (BuildContext con, index) {
                                    var item = list[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PodcastPlayer(songId: item['_id'])));
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          height: MediaQuery.of(context).size.height * 0.3,
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage("https://podcastapp.gtcollege.in/api${item['banner']}"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          item['audio_title'],
                                          style: side_Heading,
                                        ),
                                        subtitle: Text(
                                          item['category'][0]['category_name'],
                                          style: sideHeading,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }),





                  ],
                  ),

                ),

              ),


            ),




            ),
      ),
      ),
    );
  }
}
