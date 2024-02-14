import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../ApiModel/CategoryGetModel.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'categoryList.dart';
import 'package:shimmer/shimmer.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Future<List<CategoryGet>> CategoryGetApi() async {
    var audioResponse =
    await http.get(Uri.parse("https://podcastapp.gtcollege.in/api/categorymasterget"));
    var audioData = jsonDecode(audioResponse.body);
    return (audioData as List).map((e) => CategoryGet.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    CategoryGetApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1, gradient2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Category", style: homePageHeading),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: FutureBuilder(
                    future: CategoryGetApi(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                              mainAxisSpacing: 1.0,
                              crossAxisSpacing: 1.0,
                            ),
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2, // Adjust the height as needed
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(8),topRight: Radius.circular(8)
                                    ),

                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      else if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CategoryList(
                                      categoryHead: snapshot.data![index].categoryName.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.2, // Adjust the height as needed
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "https://podcastapp.gtcollege.in/api${snapshot.data![index].categoryImage}",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 8), // Adjust the spacing as needed
                                      child: Text(
                                        snapshot.data![index].categoryName.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16, // Adjust the font size as needed
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );




                      }
                      else if (snapshot.hasError) {
                        return Text("Error");
                      }
                      return SpinKitCircle(color: button);
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


//
// GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 1.6,
// mainAxisSpacing: 1.0,
// crossAxisSpacing: 1.0,
// ),
// itemCount: snapshot.data!.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: () {
// Navigator.of(context).push(
// MaterialPageRoute(
// builder: (context) => CategoryList(
// categoryHead: snapshot.data![index].categoryName.toString(),
// ),
// ),
// );
// },
// child:
// Stack(
// children: [
// Column(
// children: [
// Container(
// height: MediaQuery.of(context).size.height * 0.115,
// width: MediaQuery.of(context).size.width * 0.45,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(20),
// topLeft: Radius.circular(20),
// bottomLeft: Radius.circular(8),
// topRight: Radius.circular(8),
// ),
// color: Colors.transparent,
// image: DecorationImage(
// image: NetworkImage(
// "https://podcastapp.gtcollege.in/api${snapshot.data![index].categoryImage}",
// ),
// fit: BoxFit.fill,
// ),
// ),
// ),
// Text(
// snapshot.data![index].categoryName.toString(),
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.white,
// fontSize: 20,
// ),
// ),
// ],
// ),
//
// Positioned(
// bottom: 30,
// left: 10,
// child: Text(
// snapshot.data![index].categoryName.toString(),
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.white,
// fontSize: 20,
// ),
// ),
// ),
// ],
// ),
//
//
// );
//
// },
// );