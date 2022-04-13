import 'package:flutter/material.dart';
import 'custom_text.dart';

class TitleNewHot extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final Color? textColor;
  final String iconText;
  final EdgeInsetsGeometry? padding;
  const TitleNewHot({Key? key, required this.text, this.containerColor, this.textColor,required this.iconText,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: padding?? const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: containerColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            customText(text: iconText,size: 18),
            const SizedBox(width: 3,),
            customText(text: text,color: textColor,weight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
