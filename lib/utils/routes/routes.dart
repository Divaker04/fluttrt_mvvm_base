
import 'package:flutter/material.dart';
import 'package:fluttrt_mvvm/utils/routes/routes_names.dart';
import 'package:fluttrt_mvvm/view/home_screen.dart';
import 'package:fluttrt_mvvm/view/login_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(body: Center(
            child: Text("No Routes Find"),
          ),);
        });
    }
  }
}