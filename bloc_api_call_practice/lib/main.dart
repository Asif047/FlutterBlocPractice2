import 'package:bloc_api_call_practice/bloc/restaurant_bloc.dart';
import 'package:bloc_api_call_practice/ui/pages/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// own import


import 'data/repository/restaurant_repository.dart';
import 'ui/pages/home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api-Get',
      home: LoginScreen(),
    );
  }
}
