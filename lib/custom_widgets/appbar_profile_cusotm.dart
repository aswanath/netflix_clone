import 'package:flutter/material.dart';

import '../global_usage_variables.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.cast,
          size: 24,
          color: commonWhite,
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
            width: 25,
            height: 25,
            child: Image.asset(
              'assets/images/profile_image.png',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
