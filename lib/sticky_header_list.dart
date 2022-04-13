import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/custom_widgets/custom_text.dart';
import 'package:netflix_clone/services/constant_values.dart';

import 'custom_widgets/icon_and_text.dart';
import 'global_usage_variables.dart';

class StickyHeaderGrid extends StatelessWidget {
   StickyHeaderGrid({Key? key, required this.index, required this.list})
      : super(key: key);

  final int index;
  final List<dynamic> list;
  List<dynamic> genreStringList = [];

  @override
  Widget build(BuildContext context) {
    genreStringList = getGenres(list[index].genreList);
    return SliverStickyHeader(
      overlapsContent: true,
      header: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: DateFormat("MMM").format(DateTime.parse(list[index].date)).toUpperCase(),
              color: Colors.grey,
            ),
            customText(
                text: DateFormat("dd").format(DateTime.parse(list[index].date)),
                size: 25,
                weight: FontWeight.bold),
          ],
        ),
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(left: 40, top: 20),
        sliver: SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: 349,
                      height: 200,
                      child: Image.network(
                        '${Constants.imageId}${list[index].image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.volume_off_outlined,
                        color: commonWhite,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          list[index].title,
                          style: GoogleFonts.gideonRoman(
                              color: commonWhite,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const NavBarItem(
                    iconData: Icons.notifications_none_outlined,
                    text: 'Remind Me',
                    iconColor: commonWhite,
                    weight: FontWeight.normal,
                    color: Colors.grey,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const NavBarItem(
                    iconData: Icons.info_outline,
                    text: 'Info',
                    iconColor: commonWhite,
                    weight: FontWeight.normal,
                    color: Colors.grey,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              customText(text: 'Limited Series coming on Friday'),
              const SizedBox(
                height: 15,
              ),
              customText(text: list[index].title, weight: FontWeight.bold),
              const SizedBox(
                height: 5,
              ),
              Text(list[index].overview,style: GoogleFonts.abel(color: Colors.grey),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                children: List.generate(
                    list[index].genreList.length,
                    (i) {
                      return customText(
                        text: '${genreStringList[i]}    ',
                        weight: FontWeight.bold);}
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<String> getGenres(List<dynamic> list){
    List<String> genreStringList = [];
    for(int i in list){
      switch(i){
        case 28:
          genreStringList.add('Action');
          break;
        case 12:
          genreStringList.add('Adventure');
          break;
        case 16:
          genreStringList.add('Animation');
          break;
        case 35:
          genreStringList.add('Comedy');
          break;
        case 80:
          genreStringList.add('Crime');
          break;
        case 99:
          genreStringList.add('Documentary');
          break;
        case 18:
          genreStringList.add('Drama');
          break;
        case 10751:
          genreStringList.add('Family');
          break;
        case 14:
          genreStringList.add('Fantasy');
          break;
        case 36:
          genreStringList.add('History');
          break;
        case 27:
          genreStringList.add('Horror');
          break;
        case 10402:
          genreStringList.add('Music');
          break;
        case 9648:
          genreStringList.add('Mystery');
          break;
        case 10749:
          genreStringList.add('Romance');
          break;
        case 878:
          genreStringList.add('Science Fiction');
          break;
        case 10770:
          genreStringList.add('TV Movie');
          break;
        case 53:
          genreStringList.add('Thriller');
          break;
        case 10752:
          genreStringList.add('War');
          break;
        case 37:
          genreStringList.add('Western');
          break;
      }
    }
    return genreStringList;
  }
}

