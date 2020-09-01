import 'package:flutter/material.dart';
import 'package:refresh_tokens_with_firebase/pages/home_page.dart';
import 'package:refresh_tokens_with_firebase/pages/login_page.dart';
import 'package:refresh_tokens_with_firebase/pages/register_page.dart';
import 'package:refresh_tokens_with_firebase/pages/splash_page.dart';
import 'package:refresh_tokens_with_firebase/routes/route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.SPLASH: (_) => SplashPage(),
  RouteNames.LOGIN: (_) => LoginPage(),
  RouteNames.REGISTER: (_) => RegisterPage(),
  RouteNames.HOME: (_) => HomePage(),
};
