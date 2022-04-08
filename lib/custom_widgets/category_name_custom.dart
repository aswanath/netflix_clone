import 'package:flutter/material.dart';

import 'custom_text.dart';

class CategoryHeading extends StatelessWidget {
  final String text;
  const CategoryHeading({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 2),
      child: customText(
          text: text, weight: FontWeight.w900, size: 16),
    );
  }
}
