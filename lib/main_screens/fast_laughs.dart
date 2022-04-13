import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/custom_text.dart';
import 'package:netflix_clone/custom_widgets/icon_and_text.dart';
import 'package:netflix_clone/global_usage_variables.dart';
import 'package:netflix_clone/services/http_services.dart';
import 'package:video_player/video_player.dart';

import '../custom_widgets/shimmer_replacement_loading.dart';
import '../services/constant_values.dart';

class FastLaughs extends StatefulWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  State<FastLaughs> createState() => _FastLaughsState();
}

class _FastLaughsState extends State<FastLaughs> {
  late VideoPlayerController _videoPlayerController;
  late VideoPlayerController _videoPlayerControllerTwo;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _videoPlayerController.play());
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: commonBlack,
      body: (_videoPlayerController.value.isInitialized)
          ? PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width,
                  child: VideoPlayer(_videoPlayerController),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,bottom: 30),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/images/profile_image.png',
                              fit: BoxFit.cover,
                            )),
                        const Padding(
                          padding:  EdgeInsets.only(top: 20),
                          child:  NavBarItem(
                            gape: 8,
                            iconData: Icons.emoji_emotions,
                            text: 'LOL',
                            iconColor: commonWhite,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top: 20),
                          child:  NavBarItem(
                            gape: 8,
                            iconData: Icons.add,
                            text: 'My List',
                            iconColor: commonWhite,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top: 20),
                          child:  NavBarItem(
                            gape: 8,
                            iconData: Icons.telegram_outlined,
                            text: 'Share',
                            iconColor: commonWhite,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top: 20),
                          child:  NavBarItem(
                            iconSize: 35,
                            gape: 8,
                            iconData: Icons.play_arrow,
                            text: 'Play',
                            iconColor: commonWhite,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  child: Icon(Icons.volume_off_outlined,color: commonWhite,),
                  left: 15,
                  bottom: 25,
                )
              ],
            );
          })
          : const CircularProgressIndicator(color: Colors.black,),
    ));
  }
}

