import 'dart:convert';
import 'package:pro27/Screens/podcastPlayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'package:shimmer/shimmer.dart';
import '../ApiModel/AudioGetModel.dart';
import '../colors.dart';
import '../textstyle.dart';



class audioList extends StatefulWidget {
  const audioList({super.key});

  @override
  State<audioList> createState() => _audioListState();
}

class _audioListState extends State<audioList> {

  late Future<List<AudioGet>> _audioFuture;


  Future<List<AudioGet>> AudioGetApi() async{
    var homeResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/audiouploadmasterget"));
    var audioData =jsonDecode(homeResponse.body);
    print(audioData);
    return (audioData as List).map((e) => AudioGet.fromJson(e)).toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioFuture = AudioGetApi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1,gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back,size: 30,color: textColor,),
                        )
                    ),
                    SizedBox(width: 50),
                    Text("Podcast List",style: homePageHeading,)
                  ],
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
                            Container(
                              height: MediaQuery.of(context).size.height*0.8,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: list.length,
                                  itemBuilder: (BuildContext con,index)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap:(){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (BuildContext context) => PodcastPlayer(songId: list[index].sId)));
                                        },
                                        child: ListTile(
                                          leading: Container(
                                            height:MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.3,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(("https://podcastapp.gtcollege.in/api${list[index].banner}")),
                                                  fit: BoxFit.fill,
                                                )
                                            ),
                                          ),
                                          title: Text((list[index].audioTitle).toString(),style: sideHeading,),
                                          subtitle:Text((list[index].duration).toString(),style: sideHeading,) ,
                                          trailing: GestureDetector(
                                              onTap: (){
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:(BuildContext context) {
                                                      return SingleChildScrollView(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [gradient1,gradient2],
                                                                begin: Alignment.topCenter,
                                                                end: Alignment.bottomRight,
                                                              )
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      height:MediaQuery.of(context).size.height*0.3,
                                                                      width: MediaQuery.of(context).size.width*0.8,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                            image: NetworkImage("https://podcastapp.gtcollege.in/api${list[index].banner}"),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Text((list[index].audioTitle).toString(),style: sideHeading,),
                                                                        Text((list[index].duration).toString(),style: sideHeading,)
                                                                      ],
                                                                    ),
                                                        
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(Icons.add_circle_outline_sharp,color: button,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("Add to Queue",style: sideHeading,),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(Icons.remove_circle_outline,color: button,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("Remove from Queue",style: sideHeading,),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(Icons.ios_share_rounded,color: button,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("Share",style: sideHeading,),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(Icons.person_add_rounded,color: button,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("Podcast credits",style: sideHeading,),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(Icons.attribution_rounded,color: button,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("View author",style: sideHeading,),
                                                                    )
                                                                  ],
                                                                ),
                                                                GestureDetector(
                                                                    onTap: (){
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Text("Close",style: sideHeading,)
                                                                )
                                                        
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                );
                                              },
                                              child: Icon(Icons.more_vert,color: textColor,)
                                          ) ,


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
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 9,
                                itemBuilder: (BuildContext context, int index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.15,
                                      width: MediaQuery.of(context).size.width*0.35,                                    color: Colors.white,
                                    ),
                                  );
                                }
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
