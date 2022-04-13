import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:netflix_clone/custom_widgets/appbar_profile_cusotm.dart';
import 'package:netflix_clone/custom_widgets/custom_text.dart';
import 'package:netflix_clone/custom_widgets/icon_and_text.dart';
import 'package:netflix_clone/global_usage_variables.dart';
import 'package:netflix_clone/services/constant_values.dart';
import 'package:netflix_clone/services/http_services.dart';
import '../custom_widgets/new_hot_titles.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import '../custom_widgets/shimmer_replacement_loading.dart';
import '../sticky_header_list.dart';

class NewsAndHot extends StatefulWidget {
  NewsAndHot({Key? key}) : super(key: key);

  @override
  State<NewsAndHot> createState() => _NewsAndHotState();
}

class _NewsAndHotState extends State<NewsAndHot> {
  late LinkedScrollControllerGroup _controllers;
  final firstKey = GlobalKey();
  final secondKey = GlobalKey();
  int index = 0;
  HttpServices httpServices = HttpServices();

  @override
  void initState() {
    _controllers = LinkedScrollControllerGroup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(text: 'New & Hot', weight: FontWeight.w900, size: 22),
            const AppBarProfile(),
          ],
        ),
        // bottom: PreferredSize(
        //     child: Padding(
        //       padding: const EdgeInsets.only(bottom: 10),
        //       child: SizedBox(
        //         height: 40,
        //         child: ListView(
        //           scrollDirection: Axis.horizontal,
        //           shrinkWrap: true,
        //           children: const [
        //             TitleNewHot(
        //               text: 'Coming soon',
        //               iconText: '🍿',
        //               containerColor: commonWhite,
        //               textColor: commonBlack,
        //             ),
        //             TitleNewHot(text: "Everyone's watching", iconText: '🔥'),
        //             TitleNewHot(text: "Top 10", iconText: '🔟'),
        //             TitleNewHot(text: "Everyone's watching", iconText: '🔥'),
        //           ],
        //         ),
        //       ),
        //     ),
        //     preferredSize: const Size(double.infinity, 50)),
      ),
      body: FutureBuilder(
          future: newAndHotAll(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<dynamic> upcomingList = snapshot.data[0];
              List<dynamic> everyoneList = snapshot.data[1];
              return ScrollableListTabView(
                  tabs: [
                ScrollableListTab(
                  tab:  ListTab(
                    activeBackgroundColor: commonWhite,
                    inactiveBackgroundColor: commonBlack,
                    borderRadius: BorderRadius.circular(30),
                    label: "🍿  Coming soon",
                  ),
                  body: CustomScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    slivers: List.generate(
                        upcomingList.length,
                        (index) => StickyHeaderGrid(
                              index: index,
                              list: upcomingList,
                            )).toList(),
                  ),
                ),
                ScrollableListTab(
                  tab:  ListTab(
                    activeBackgroundColor: commonWhite,
                    inactiveBackgroundColor: commonBlack,
                    borderRadius: BorderRadius.circular(30),
                    label: "🔥  Everyone's watching",
                  ),
                  body: CustomScrollView(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    slivers: List.generate(
                        everyoneList.length,
                            (index) => StickyHeaderGrid(
                          index: index,
                          list: everyoneList,
                        )).toList(),
                  ),
                ),
                    ScrollableListTab(
                      tab:  ListTab(
                        activeBackgroundColor: commonWhite,
                        inactiveBackgroundColor: commonBlack,
                        borderRadius: BorderRadius.circular(30),
                        label: "🍿  Top 10",
                      ),
                      body: CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        slivers: List.generate(
                            upcomingList.length,
                                (index) => StickyHeaderGrid(
                              index: index,
                              list: upcomingList,
                            )).toList(),
                      ),
                    ),
              ]);
            } else {
              return ShimmerReplacement();
            }
          }),
    );
  }

  Future<dynamic>? newAndHotAll() async {
    dynamic list = [];
    final list1 = await httpServices.getUpcoming(Constants.upComing);
    final list2 = await httpServices.getUpcoming(Constants.everyoneWatching);
    // final list3 = await httpServices.getUpcoming(Constants.top10);
    list = [list1, list2];
    return list;
  }
}

// FutureBuilder(
// future: httpServices.getUpcoming(),
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// if(snapshot.hasData){
// List<dynamic> list = snapshot.data;
// return
// }else{
// return const ShimmerReplacement();
// }
// }
// )
