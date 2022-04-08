import 'package:flutter/material.dart';
import 'package:netflix_clone/custom_widgets/custom_text.dart';
import 'package:netflix_clone/custom_widgets/shimmer_replacement_loading.dart';
import 'package:netflix_clone/global_usage_variables.dart';
import 'package:netflix_clone/services/http_services.dart';

import '../services/constant_values.dart';

String firstImage = '';
String secondImage = '';
String thirdImage = '';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: commonBlack,
        appBar: AppBar(
          backgroundColor: commonBlack,
         title: Container(
           padding: const EdgeInsets.symmetric(vertical: 5),
           decoration: BoxDecoration(
             color: Colors.grey,
             borderRadius: BorderRadius.circular(5),
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Icon(Icons.search,size: 16,),
               const SizedBox(width: 5,),
               customText(text: 'Search',size: 13),
             ],
           ),
         ),
        ),
        body: FutureBuilder(
          future: HttpServices().getUpcoming(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              List<dynamic> list = snapshot.data!;
              return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: customText(text: 'Top Searches',weight: FontWeight.bold,size: 16),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                      ClipRRect(
                        borderRadius:BorderRadius.circular(5),
                        child: SizedBox(
                          height:90,
                          width: 160,
                          child: Image.network('${Constants.imageId}${list[index].image}',fit: BoxFit.cover,),
                        ),
                      ),
                        const SizedBox(width: 10,),
                        SizedBox(
                      child: customText( text:list[index].title,weight: FontWeight.bold),width: 150,),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: commonWhite),
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(.5)),
                          child: const Icon(
                            Icons.play_arrow,
                            color: commonWhite,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: 20,)
                      ],
                    ),
                  );
                }),
              )
            ],
          );}else{
              return ShimmerReplacement();
            }}
        )
      ),
    );
  }
}
