import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../ApiModel/AudioGetModel.dart';
import '../ApiModel/AuthorDataGetModel.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'authorProfile.dart';

class CategoryList extends StatefulWidget {
  final String categoryHead;
  const CategoryList({super.key, required this.categoryHead});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  Future<List<AuthorGet>> CategoryGetApi() async{
    var authorListResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/authormasterget"));
    var authorListData =jsonDecode(authorListResponse.body);
    print(authorListData);
    return (authorListData as List).map((e) => AuthorGet.fromJson(e)).toList();
  }

  // Future<List<AudioGet>> AudioApi() async{
  //   var audioResponse = await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/audiouploadmasterget"));
  //   var audio =jsonDecode(audioResponse.body);
  //   return (audio as List).map((e) => AudioGet.fromJson(e)).toList();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryGetApi();
    //AudioApi();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              gradient1,gradient2
            ],
                begin: Alignment.topCenter,
                end: Alignment.center
            ),
          ),
          child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,size: 30,color: textColor,)
                    ),
                    SizedBox(width: 10),
                    Text(widget.categoryHead,style: homePageHeading,),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text("Authors", style: sideHeading,),
                        )
                      ],
                    ),

                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  child:FutureBuilder(
                    future: CategoryGetApi(),
                    builder: (BuildContext context, snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting){

                        return Shimmer.fromColors( baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[200]!,
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context,index)
                              {
                                return ListTile(
                                  leading: Container(
                                    height: MediaQuery.of(context).size.height*0.3,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  title: Container(
                                    height: 16.0,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 12.0,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    color: Colors.white,
                                  ),);

                              }),
                        );}

                      else if(snapshot.hasData){
                        return ListView.builder(

                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthorProfile(authorId: snapshot.data![index].sId.toString(),
                                  )));
                                },
                                child: ListTile(
                                  leading: Container(
                                    height: MediaQuery.of(context).size.height*0.15,
                                    width: MediaQuery.of(context).size.width*0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
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
                                          image: NetworkImage("https://podcastapp.gtcollege.in/api${snapshot.data![index].authorProfilePicture}"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),

                                  title: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(snapshot.data![index].authorName.toString(),style: side_Heading,),
                                  ),
                                 //subtitle: Text(snapshot.data![index].socialMedia.toString(),style: side_Heading,),
                                ),
                              );
                            }
                        );
                      }
                      else if(snapshot.hasError){
                        return Text("${snapshot.error}");
                      }
                      return SpinKitCircle(color: button);
                    },

                  ),

                )
              ]
          ),
        ),
      ),
    );
  }
}

