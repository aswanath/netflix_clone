import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/appbar_profile_cusotm.dart';
import 'package:netflix_clone/custom_widgets/custom_text.dart';
import 'package:netflix_clone/custom_widgets/downloads_stack.dart';
import 'package:netflix_clone/global_usage_variables.dart';
import 'package:netflix_clone/services/http_services.dart';

import '../services/constant_values.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commonBlack,
        title: Row(
          children: [
            customText(text: 'Downloads', size: 20, weight: FontWeight.bold),
            const Spacer(),
            const AppBarProfile()
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 20),
          child: Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              const Icon(
                Icons.settings,
                color: commonWhite,
              ),
              const SizedBox(
                width: 5,
              ),
              customText(text: 'Smart Downloads', size: 13)
            ],
          ),
        ),
      ),
      backgroundColor: commonBlack,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(
                text: 'Introducing Downloads for You',
                weight: FontWeight.bold,
                size: 22),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: customText(
                  text:
                      "We'll download a personalised selection of films and programmes for you, so there's always something to watch on your device.",
                  align: TextAlign.center,
                  color: Colors.grey),
            ),
            SizedBox(
              width: 250,
              height: 230,
              child: FutureBuilder(
                future: HttpServices().getTopRated(Constants.topRated),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                    return  Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom:30,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.grey[850],
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 45,
                      child: Transform.rotate(
                          angle: .32,
                          child:  DownloadsStack(
                            height: 120,
                            width: 75, link: snapshot.data[0].imageLink,
                          )),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 45,
                      child: Transform.rotate(
                          angle: -.32,
                          child:  DownloadsStack(
                            height: 120,
                            width: 75, link: snapshot.data[1]
                              .imageLink,
                          )),
                    ),
                     DownloadsStack(link: snapshot.data[2]
                         .imageLink,),
                  ],
                );}else{
                    return Container();
                  }}
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue[600]),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 130),
              child:
                  customText(text: 'Set up', weight: FontWeight.bold, size: 16),
            ),
            const SizedBox(height: 12,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: commonWhite),
              child: customText(text: 'See What You Can Download',color: commonBlack,weight: FontWeight.bold,size: 15),
            )
          ],
        ),
      ),
    );
  }
}
