


// podcast_details.dart

class PodcastDetails {
  final String? author;
  final String? audioName;

  PodcastDetails({this.author, this.audioName});

  factory PodcastDetails.fromJson(Map<String, dynamic> json) {
    return PodcastDetails(
      author: json['author'],
      audioName: json['audioName'],
    );
  }
}




















//
// import 'package:flutter/cupertino.dart';
//
// class PodcastDetailsDataModel {
//   String? title;
//   String? author;
//   String? bannerImage;
//   String? description;
//   String? duration;
//   String? song;
//   String? songname;
//
//
//   PodcastDetailsDataModel(this.title,this.author, this.bannerImage, this.duration, this.description,this.song,this.songname);
//
// }
//
// List<PodcastDetailsDataModel> podcastDataModelList = podcastDetails.map((e) => PodcastDetailsDataModel(e["title"], e['author'],e["bannerImage"],e["duration"],e["description"],e['song'],e['songname'])).toList();
//
// var podcastDetails = [
//
//   {
//     'title':'Shabana',
//     'author':'Motivation',
//     'songname':'Maaveeran',
//     'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//
//   {
//     'title':'Subaguru Prabakaran',
//     'author':'Technology',
//     'songname':'Maaveeran',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Gowri Shankar',
//     'author':'Motivation',
//     'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Makila Padmavathi',
//     'author':'Motivation',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Snekha',
//     'author':'Arts',
//     'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Manikandan',
//     'author':'',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Jai Ganesh',
//     'author':'',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Sanjeeva Dharshini',
//     'author':'',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Mohana Priya',
//     'author':'',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Keerthi',
//     'author':'History',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Viveka',
//     'author':'Sports',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//
//     'title':'Vishnu Vardhini',
//     'author':'Society',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//   {
//     'title':'Rajalakshmi',
//     'author':'Motivation',
//     'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
//     'description':'A overview of flutter',
//     'duration':'2m 45s',
//     'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
//   },
//
//
// ];
//
//
//
//
//
//
//
//
//



