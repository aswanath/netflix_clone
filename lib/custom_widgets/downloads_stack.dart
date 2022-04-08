import 'package:flutter/material.dart';

import '../services/constant_values.dart';

class DownloadsStack extends StatelessWidget {
  final double? height;
  final double? width;
  final String link;
  const DownloadsStack({Key? key, this.height, this.width,required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        height: height??140,
        width: width??95,
        child: Image.network('${Constants.imageId}$link',fit: BoxFit.fill,),
      ),
    );
  }
}
