import 'package:flutter/material.dart';
import 'package:netflix_clone/global_usage_variables.dart';

import 'custom_text.dart';

class NavBarItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final double? size;
  final Color? color;
  final Color? iconColor;
  final FontWeight? weight;
  final double? gape;
  final double? iconSize;
   const NavBarItem({Key? key,required this.iconData,this.iconSize,required this.text,this.size,this.color,this.gape,this.iconColor,this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(iconData,color: iconColor,size: iconSize,),
         SizedBox(height: gape??2,),
        customText(text: text,weight: weight??FontWeight.w600,size: size??14,color: color,),
      ],
    );
  }
}
