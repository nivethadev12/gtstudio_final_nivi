import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pro27/Screens/podcastPlayer.dart';
import 'package:shimmer/shimmer.dart';
import '../ApiModel/AudioGetModel.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'package:http/http.dart' as http;
import '../datamodel/podcastdetails.dart';
import 'audioList.dart';
import 'authorProfile.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List data = [];
  late Future<List<AudioGet>> _audioFuture;
  void fetchAuthors(String keyword) async {
    final url = Uri.parse('https://podcastapp.gtcollege.in/api/audiouploadmastersearch');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'keyword': keyword,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON response
      // and handle it accordingly.
      List<dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse); // Print the JSON response for debugging

      List<PodcastDetails> podcastList = [];

      // Iterate through the jsonResponse and access the author object within each Data object
      for (var jsonData in jsonResponse) {
        var data = jsonData['Data'];
        var author = data['author'];
        var audioname=data['audio_title'];
        // var category=data[]
        var podcastDetails = PodcastDetails(
          author: author['author_name'],
          audioName: data['audio_title'], // Access and assign audio name here
        );
        podcastList.add(podcastDetails);
      }

      // Set the data list to the parsed podcastList
      setState(() {
        data = podcastList;
      });

      // Do something with the data
      print(data);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load authors');
    }
  }

  Future<List<AudioGet>> AudioGetApi() async{
    var homeResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/audiouploadmasterget"));
    var audioData =jsonDecode(homeResponse.body);
    print(audioData);
    return (audioData as List).map((e) => AudioGet.fromJson(e)).toList();
  }

  void initState(){
    _audioFuture = AudioGetApi();
  }






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xff1e1f1a)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          fetchAuthors(value);
                        },
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded, color: Color(0xff000000)),
                            hintText: "Search....",
                            hintStyle: placeholderText,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    // Search list
                    data.isNotEmpty
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final podcast = data[index];
                        final subtitleshow = podcast.audioName;
                        final titleToShow = podcast.author?.isNotEmpty == true
                            ? "${podcast.author}"
                            : "";

                        return ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AuthorProfile(authorId: '',)));

                          },
                          title: Text("Name   :${titleToShow.toString()}", style: sideHeading),
                          subtitle: podcast.audioName?.isNotEmpty == true
                              ? Text("Audio   :${subtitleshow.toString()}", style: sideHeading)
                              : null, // Only show subtitle if author is not empty
                        );
                      },
                    )
                        : Column(
                      children: [
                        SizedBox(height: 20,),
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
                                            Text("Popular",style: TextStyle(color: Colors.white),),
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
                                      height: MediaQuery.of(context).size.height*0.70,
                                      child:
                                      ListView.builder(
                                          shrinkWrap: true,
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
                                                  child: Stack(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.of(context).size.height*0.15,
                                                            width: MediaQuery.of(context).size.width*0.40,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(25),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black54,
                                                                  blurRadius: 5,
                                                                  spreadRadius: 2,
                                                                  offset: Offset(
                                                                      5.0,
                                                                      5.0
                                                                  ),
                                                                )
                                                              ],
                                                              image: DecorationImage(
                                                                image: NetworkImage("https://podcastapp.gtcollege.in/api${list[index].banner.toString()}"),
                                                                fit: BoxFit.fill,
                                                              ),
                                                              color: Colors.cyan,
                                                            ),

                                                          ),SizedBox(width: 50,),
                                                          Text("hi",style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        ],
                                                      ),


                                                    ],
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
