import 'package:flutter/material.dart';


import '../../colors.dart';
import '../../textstyle.dart';

class AudioQuality extends StatefulWidget {
  const AudioQuality({super.key});

  @override
  State<AudioQuality> createState() => _AudioQualityState();
}

class _AudioQualityState extends State<AudioQuality> {

  String selectedAudioQuality = '';
  String selectedAudioQuality1 = '';


  Widget buildAudioQualityOption(String title, String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAudioQuality = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: homePage_Heading,),
            Icon(
              selectedAudioQuality == value
                  ? Icons.check
                  : null,
              color: selectedAudioQuality == value ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  Widget buildAudioQualityOption1(String title, String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAudioQuality1 = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: homePage_Heading,),
            Icon(
              selectedAudioQuality1 == value
                  ? Icons.check
                  : null,
              color: selectedAudioQuality1 == value ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1e1f1a),
            leading:  GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                },
              child: Icon(Icons.arrow_back,color: textColor,size:30),
            ),
            title: Text("Audio Quality",style: homePageHeading,),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              color: Color(0xff1e1f1a)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Streaming",style: homePageHeading,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wi-Fi streaming",style: homeSubHeading,),
                        buildAudioQualityOption('Automatic', 'automatic'),
                        buildAudioQualityOption('Low', 'low'),
                        buildAudioQualityOption('Normal', 'normal'),
                        buildAudioQualityOption('High', 'high'),
                      ],
                    ),
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height*0.02,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile streaming",style: homeSubHeading,),
                        buildAudioQualityOption1('Automatic', 'automatic'),
                        buildAudioQualityOption1('Low', 'low'),
                        buildAudioQualityOption1('Normal', 'normal'),
                        buildAudioQualityOption1('High', 'high'),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ),
        )
    );
  }
}
