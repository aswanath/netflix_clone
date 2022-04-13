import 'dart:convert';

import 'package:http/http.dart';
import 'package:netflix_clone/services/constant_values.dart';

import 'model_tmdb.dart';

class HttpServices {
  Future<List<dynamic>> getTopRated(String listType) async {

    Response res = await get(Uri.parse(listType));

    if (res.statusCode == 200) {

      final decoded = jsonDecode(res.body);
       List<dynamic> list =
          decoded['results'].map((item) => TopRated.fromJson(item)).toList();
      return list;
    } else {
      throw "Can't get list";
    }
  }

  Future<List<dynamic>> getUpcoming(String link) async{

    Response res = await get(Uri.parse(link));

    if(res.statusCode==200){
      final decoded = jsonDecode(res.body);
      final list = decoded['results'].map((item)=> UpComing.fromJson(item)).toList();
      return list;
    }else{
      throw "Can't get list";
    }
  }
}
