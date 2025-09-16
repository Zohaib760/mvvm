
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/log_in_screen.dart';
import 'package:mvvm/view/sign_up_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes{

  static  Route<dynamic>  generatedRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context)=> LogInView());
      case RoutesNames.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> SignUpView());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> SplashView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body:Center(
              child: Text(" No Route Defined "),
            ) ,
          );
        });
    }
  }
}