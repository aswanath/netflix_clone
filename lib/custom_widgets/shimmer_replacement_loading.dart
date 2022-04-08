import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/shimmer_custom.dart';

class ShimmerReplacement extends StatelessWidget {
  const ShimmerReplacement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomWidget.circular(width: 80, height: 80),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  CustomWidget.circular(width: 80, height: 80),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  CustomWidget.circular(width: 80, height: 80),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  CustomWidget.circular(width: 80, height: 80),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget.rectangular(width: 260, height: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomWidget.rectangular(width: 350, height: 100),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomWidget.rectangular(width: 100, height: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomWidget.rectangular(width: 100, height: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomWidget.rectangular(width: 100, height: 150),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
