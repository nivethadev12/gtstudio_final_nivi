import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import '../ApiModel/AudioGetModel.dart';
import 'package:http/http.dart' as http;
import '../textstyle.dart';
import '/colors.dart';


class PodcastPlayer extends StatefulWidget {


  final String? songId;


  const PodcastPlayer({super.key, required this.songId});

  get authorId => true;


  @override
  State<PodcastPlayer> createState() => _PlaySongState();
}

class _PlaySongState extends State<PodcastPlayer> {
  List<AudioGet> list = [];

  Future<List<AudioGet>> AudioGetById() async {
    try {
      var audioIdResponse = await http.get(Uri.parse(
          "https://podcastapp.gtcollege.in/api/audiouploadgetbyid/${widget.songId}"));
      print(audioIdResponse.body);

      if (audioIdResponse.statusCode == 200) {
        var audioID = (jsonDecode(audioIdResponse.body) as List).map((e) => AudioGet.fromJson(e)).toList();
        // setState(() {
        //   list = audioID;
        // });
        return audioID;
      } else {
        throw Exception("Failed to load audio data");
      }
    } catch (e) {
      print("Error fetching audio data: $e");
      throw Exception("Failed to load audio data");
    }
  }

  late AudioPlayer _audioPlayer;
  double _sliderValue = 0.0;
  double _playbackSpeed = 1.0; // Initial playback speed

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    //AudioGetId();
    _initPlayer();
  }
  Future<void> _initPlayer() async {



    try {
      List<AudioGet> audioList = await AudioGetById();

      if (audioList.isNotEmpty) {
        AudioGet audioGet = audioList.first;
        //print("AudioGet retrieved: $audioGet");

        print("hi");
        String baseUrl = "https://podcastapp.gtcollege.in/api";
        print("$baseUrl${audioList[0].audioUpload.toString()}");
        await _audioPlayer.setUrl('$baseUrl${audioList[0].audioUpload.toString()}');

        //await _audioPlayer.setUrl("https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3");

        // Listen for player state changes
        _audioPlayer.playerStateStream.listen((playerState) {
          print("Player state changed: $playerState");
          final position = _audioPlayer.position;
          setState(() {
            // Update the slider value when the position is available
            _sliderValue = position.inSeconds.toDouble();
          });
        });

        // Listen for position changes
        _audioPlayer.positionStream.listen((position) {
          print("Position changed: $position");
          setState(() {
            _sliderValue = position.inSeconds.toDouble();
          });
        });
      } else {
        print("Error: Audio list is empty");
      }
    } catch (e) {
      print("Error initializing player: $e");
    }
  }





  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2,'0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2,'0');
    return '$minutes:$seconds';
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: AudioGetById(),
                builder: (BuildContext context,  snapshot) {
                  if(snapshot.hasData){
                    return Container(
                      height: MediaQuery.of(context).size.height*1,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(Icons.arrow_back,color: textColor,size:30)
                                    ),
                                    GestureDetector(
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
                                                          end: Alignment.bottomCenter,
                                                        )
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              height:MediaQuery.of(context).size.height*0.20,
                                                              width: MediaQuery.of(context).size.width*.89,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: NetworkImage(('https://podcastapp.gtcollege.in/api${snapshot.data![index].banner}').toString()),
                                                                  )
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(snapshot.data![index].audioTitle.toString(),
                                                                  style: side_Heading,
                                                                ),
                                                                Text(snapshot.data![index].language.toString(),
                                                                  style: side_Heading,
                                                                ),
                                                                Text(snapshot.data![index].duration.toString(),
                                                                  style: side_Heading,
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                        SizedBox(height: 10),



                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(width: 10),
                                                        //     Icon(Icons.add_circle_outline_sharp,color: Colors.white,),
                                                        //     Padding(
                                                        //       padding: const EdgeInsets.only(left: 8.0),
                                                        //       child: Text("Add to Queue",
                                                        //         style: side_Heading,
                                                        //       ),
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        // SizedBox(height: 10),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(width: 10),
                                                        //     Icon(Icons.remove_circle_outline,color: Colors.white,),
                                                        //     Padding(
                                                        //       padding: const EdgeInsets.only(left: 8.0),
                                                        //       child: Text("Remove from Queue",
                                                        //         style: side_Heading,
                                                        //       ),
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        SizedBox(height: 10),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: 20),

                                                            Icon(Icons.share_sharp,color: Colors.white,),
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(left: 15),
                                                            //   child: Text("Share",
                                                            //     style: side_Heading,
                                                            //   ),
                                                            //
                                                            // ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Share.share('https://podcastapp.gtcollege.in/api');
                                                              },
                                                              child: Text('Share',
                                                                style: side_Heading,),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(width: 10),
                                                        //     Icon(Icons.person_add_rounded,color: Colors.white,),
                                                        //     Padding(
                                                        //       padding: const EdgeInsets.only(left: 8.0),
                                                        //       child: Text("Podcast credits",
                                                        //         style: side_Heading,
                                                        //       ),
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        // SizedBox(height: 10),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(width: 10),
                                                        //     Icon(Icons.attribution_rounded,color: Colors.white,),
                                                        //     Padding(
                                                        //       padding: const EdgeInsets.only(left: 8.0),
                                                        //       child: Text("View author",
                                                        //         style: side_Heading,
                                                        //       ),
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        // SizedBox(height: 10),



                                                        GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Text("Close",
                                                                style: side_Heading,
                                                              ),
                                                            )
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                          );
                                        },


                                        child: Icon(Icons.more_vert,size: 30,color: textColor,)
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),



                              Card(
                                elevation: 0.5,
                                color: Colors.white70,
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.35,
                                  width: MediaQuery.of(context).size.width*0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(

                                        image: NetworkImage('https://podcastapp.gtcollege.in/api${snapshot.data![index].banner.toString()}'),
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(snapshot.data![index].audioTitle.toString(),
                                      style: sideHeading
                                  ),
                                  SizedBox(height: 10),
                                  // Text(widget.songId.authorName.toString(),
                                  //   style: sideHeading,
                                  // ),
                                  SizedBox(height: 10,),

                                  Text(snapshot.data![index].category.toString(),
                                    style: sideHeading,
                                  ),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    StreamBuilder<Duration>(
                                      stream: _audioPlayer.positionStream,
                                      builder: (context, snapshot) {
                                        final position = snapshot.data ?? Duration.zero;
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Slider(
                                              activeColor: button,
                                              value: position.inSeconds.toDouble(),
                                              min: 0.0,
                                              max: _audioPlayer.duration?.inSeconds.toDouble() ?? 0.0,
                                              onChanged: (value) {
                                                _audioPlayer.seek(Duration(seconds: value.toInt()));
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 2, 15, 8),
                                              child: Row(

                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${_formatDuration(position)}',style: side_Heading,),
                                                  Text(' ${_formatDuration(_audioPlayer.duration ?? Duration.zero)}',style: side_Heading,),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );

                                      },
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.skip_previous,size: 40,color: button,),
                                            onPressed: () {
                                              // _skipToPrevious();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.replay_10, size: 40,color: button,),
                                            onPressed: () {
                                              _skip(Duration(seconds: -10));
                                            },
                                          ),
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: button,
                                            child: Center(
                                              child: IconButton(
                                                icon:
                                                Icon(_audioPlayer.playing ? Icons.pause_outlined: Icons.play_arrow, size: 40,),
                                                onPressed: () {
                                                  _togglePlayback();
                                                },
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.forward_10,size: 40,color: button,),
                                            onPressed: () {
                                              _skip(Duration(seconds: 10));
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.skip_next,size: 40,color: button,),
                                            onPressed: () {
                                              // _skipToNext();
                                            },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          );
                        },
                      ),
                    );
                  }
                  else if(snapshot.hasError){
                    return Text("${snapshot.error}",style: sideHeading,);
                  }
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.7,),
                      Center(
                        child: SpinKitCircle(
                            size: 80,
                            color: button),
                      ),
                    ],
                  );
                },

              ),
            ),
          ),
        ),
      ),
    );
  }
  ///For play and pause
  Future<void> _togglePlayback() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    setState(() {});
  }
  ///For skip
  Future<void> _skip(Duration duration) async {
    await _audioPlayer.seek(_audioPlayer.position + duration);
  }

///Skip one song forward
// void _skipToNext() {
//   if (_currentSongIndex < podcastDataModelList.length - 1) {
//     _currentSongIndex++;
//     _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
//     _audioPlayer.play();
//     setState(() {});
//   }
// }
//
// void _skipToPrevious() {
//   if (_currentSongIndex > 0) {
//     _currentSongIndex--;
//     _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
//     _audioPlayer.play();
//     setState(() {});
//   }
// }




}