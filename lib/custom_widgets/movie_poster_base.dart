import 'package:flutter/material.dart';

class BaseMoviePoster extends StatelessWidget {
  const BaseMoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 100,
          child: Image.asset(
            'assets/images/silent_sea.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
