import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/appbar_profile_cusotm.dart';
import 'package:netflix_clone/custom_widgets/category_name_custom.dart';
import 'package:netflix_clone/custom_widgets/shimmer_custom.dart';
import 'package:netflix_clone/services/constant_values.dart';
import 'package:netflix_clone/services/http_services.dart';
import 'package:netflix_clone/services/model_tmdb.dart';
import 'package:shimmer/shimmer.dart';

import '../custom_widgets/custom_text.dart';
import '../custom_widgets/icon_and_text.dart';
import '../custom_widgets/shimmer_replacement_loading.dart';
import '../global_usage_variables.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpServices httpServices = HttpServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBlack,
      body: FutureBuilder(
          future: httpServices.getTopRated(Constants.topRated),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      excludeHeaderSemantics: true,
                      elevation: 0,
                      floating: true,
                      snap: true,
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 90,
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/netflix_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const AppBarProfile(),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customText(text: 'Series', size: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                child: customText(text: 'Films', size: 16),
                              ),
                              Row(
                                children: [
                                  customText(text: 'Categories', size: 16),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: commonWhite,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ];
                },
                body: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            child: Image.network(
                              '${Constants.imageId}${snapshot.data[7]
                                  .imageLink}',
                              fit: BoxFit.fill,
                            ),
                            height: 450,
                            width: double.infinity,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const NavBarItem(
                                iconData: Icons.add,
                                text: 'My List',
                                iconColor: commonWhite,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 3),
                                decoration: const BoxDecoration(
                                    color: commonWhite,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3))),
                                child: Row(
                                  children: [
                                    const Icon(Icons.play_arrow),
                                    const SizedBox(
                                      width: 4.5,
                                    ),
                                    customText(text: 'Play', color: commonBlack)
                                  ],
                                ),
                              ),
                              const NavBarItem(
                                iconData: Icons.info_outline,
                                text: 'Info',
                                iconColor: commonWhite,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const CategoryHeading(text: 'My List'),
                    SizedBox(
                      height: 170,
                      child: FutureBuilder(
                        future: httpServices.getTopRated(Constants.topRated),
                        builder: (BuildContext context, AsyncSnapshot<List<
                            dynamic>> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> list = snapshot.data!;
                            return ListView.builder(
                              itemCount: list.length,
                              padding: const EdgeInsets.only(left: 4),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: SizedBox(
                                      width: 100,
                                      child: Image.network(
                                        '${Constants.imageId}${list[index]
                                            .imageLink}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    const CategoryHeading(text: 'Continue Watching for Appu'),
                    SizedBox(
                      height: 184,
                      width: double.infinity,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(
                              Constants.continueWatching),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data!;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 4),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                width: 100,
                                                child: Image.network(
                                                  '${Constants
                                                      .imageId}${list[index]
                                                      .imageLink}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 150,
                                                width: 100,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border:
                                                          Border.all(
                                                              color: commonWhite),
                                                          shape: BoxShape
                                                              .circle,
                                                          color: Colors.black
                                                              .withOpacity(.5)),
                                                      child: const Icon(
                                                        Icons.play_arrow,
                                                        color: commonWhite,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    customText(
                                                        text: 'S${index +
                                                            1} : E${index * 2}',
                                                        size: 10,
                                                        weight: FontWeight.bold)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: randomNumber(),
                                              valueColor: const AlwaysStoppedAnimation<
                                                  Color>(
                                                  Colors.red),
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            color: Colors.grey[900],
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: const [
                                                  Icon(
                                                    Icons.info_outline,
                                                    color: commonWhite,
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    color: commonWhite,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }
                      ),
                    ),
                    const CategoryHeading(text: 'Popular on Netflix'),
                    SizedBox(
                      height: 170,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.popular),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 4),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        width: 100,
                                        child: Image.network(
                                          '${Constants.imageId}${list[index]
                                              .imageLink}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }
                      ),
                    ),
                    const CategoryHeading(text: 'Only on Netflix'),
                    SizedBox(
                      height: 277,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.netflix),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 4),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Image.network(
                                          '${Constants.imageId}${list[index]
                                              .imageLink}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }
                      ),
                    ),
                    const CategoryHeading(text: 'Top 10 in India Today'),
                    SizedBox(
                      height: 180,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.topIndia),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: 10,
                                padding: const EdgeInsets.only(left: 4),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 180,
                                    width: 140,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          child: SizedBox(
                                            width: 110,
                                            child: Image.network(
                                              '${Constants.imageId}${list[index]
                                                  .imageLink}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -20,
                                          left: -5,
                                          child: Stack(
                                            children: [
                                              Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    fontSize: 100,
                                                    foreground: Paint()
                                                      ..style = PaintingStyle
                                                          .stroke
                                                      ..strokeWidth = 7
                                                      ..color = commonWhite
                                                ),
                                              ),
                                              Text('${index + 1}',
                                                style: const TextStyle(
                                                    fontSize: 100,
                                                    fontWeight: FontWeight.w900
                                                ),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return ShimmerReplacement();
          }
          }
      ),
    );
  }

  double randomNumber() {
    var rng = Random();
    int num = 0;
    for (var i = 1; i < 101; i++) {
      num = rng.nextInt(100);
    }
    double newNum = num / 100;
    return newNum;
  }
}
