import 'package:flutter/material.dart';
import 'package:netflix_clone/global_usage_variables.dart';

import 'main_screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        cardColor: commonBlack,
        splashColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(),
    );
  }
}


