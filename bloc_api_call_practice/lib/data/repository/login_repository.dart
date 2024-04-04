import 'dart:async';


import 'package:bloc_api_call_practice/data/model/model_login_request.dart';
import 'package:bloc_api_call_practice/data/model/model_login_response.dart';
import 'package:bloc_api_call_practice/res/strings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/api_result_model.dart';




class LoginRepository  {

  @override
  Future<ModelLoginResponse> postLoginData(ModelLoginRequest modelLoginRequest) async {

    final Map<String, dynamic> requestBody = modelLoginRequest.toJson();
    final response =  await http.post(Uri.parse("https://dummyjson.com/auth/login"),headers: {"Content-Type": "application/json"}, body: jsonEncode(requestBody));

    print("###ZZZ: ${response.body}");
    print("###ZZZ2: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("##RES:${response.body}");
      return ModelLoginResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("EEEE");
      throw Exception();
    }
  }

}