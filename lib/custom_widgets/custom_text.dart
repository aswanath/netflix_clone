import 'package:flutter/material.dart';

Widget customText({required String text,Color? color,double? size,FontWeight? weight,TextAlign? align}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
      color: color??Colors.white,
      fontSize: size,
      fontWeight: weight,
    ),
  );
}