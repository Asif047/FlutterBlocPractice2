import 'dart:async';


import 'package:bloc_api_call_practice/res/strings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/api_result_model.dart';




class RestaurantRepository  {

  @override
  Future<RestaurantModel> getRestaurantData() async {
    final response =  await http.get(Uri.parse(AppStrings.cricArticleUrl));

    if (response.statusCode == 200) {
      print("##RES:${response.body}");
      return RestaurantModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("EEEE");
      throw Exception();
    }
  }

}