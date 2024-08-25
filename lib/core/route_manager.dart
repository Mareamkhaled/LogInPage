import 'package:flutter/material.dart';
import '../pages/login_page.dart';

class RouteManager {
static  Map<String, WidgetBuilder> routes ={
    RouteName.kLogInPage:(context) => const LoginPage()
    
  };
}

class RouteName {
  static const String kLogInPage = "login_page";
  
}