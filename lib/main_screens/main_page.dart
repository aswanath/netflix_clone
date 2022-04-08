import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/icon_and_text.dart';
import 'package:netflix_clone/global_usage_variables.dart';
import 'package:netflix_clone/main_screens/downloads_page.dart';
import 'package:netflix_clone/main_screens/fast_laughs.dart';
import 'package:netflix_clone/main_screens/home_page.dart';
import 'package:netflix_clone/main_screens/news_and_hot.dart';
import 'package:netflix_clone/main_screens/search_page.dart';

import '../custom_widgets/custom_text.dart';

class MainHomePage extends StatefulWidget {
   MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List pages = [
    HomePage(),
    NewsAndHot(),
    FastLaughs(),
    SearchPage(),
    DownloadsPage(),
  ];

 int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: commonWhite),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (val){
          setState(() {
            pageIndex=val;
          });
        },
          currentIndex: pageIndex,
          items:  [
        BottomNavigationBarItem(icon: NavBarItem(iconData: pageIndex==0?Icons.home:Icons.home_outlined, text: 'Home',size: 10,color:changeTextColor(0) ,),label: ''),
        BottomNavigationBarItem(icon: NavBarItem(iconData: pageIndex==1?Icons.video_library:Icons.video_library_outlined, text: 'News & Hot',size: 10,color:changeTextColor(1)),label: ''),
        BottomNavigationBarItem(icon: NavBarItem(iconData: pageIndex==2?Icons.emoji_emotions:Icons.emoji_emotions_outlined, text: 'Fast Laughs',size: 10,color:changeTextColor(2)),label: ''),
        BottomNavigationBarItem(icon: NavBarItem(iconData: pageIndex==3?Icons.search:Icons.search_outlined, text: 'Search',size: 10,color:changeTextColor(3)),label: ''),
        BottomNavigationBarItem(icon: NavBarItem(iconData: Icons.arrow_circle_down_outlined, text: 'Downloads',size: 12,color:changeTextColor(4)),label: ''),
      ]),
      body: pages[pageIndex],
    );
  }
  Color changeTextColor(int index){
    if(pageIndex==index){
      return commonWhite;
    }else{
      return Colors.grey;
    }
  }
}
