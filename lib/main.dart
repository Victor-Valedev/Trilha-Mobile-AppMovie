import 'package:flutter/material.dart';
import 'package:moviesapp/theme/app_theme.dart';
import 'package:moviesapp/ui/login_page.dart';
import 'package:moviesapp/ui/register_page.dart';
import 'package:moviesapp/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Review',
      theme: AppTheme.appTheme,
      initialRoute: AppRoutes.LOGIN_PAGE,
      routes: {
        AppRoutes.LOGIN_PAGE: (ctx) => LoginPage(),
        AppRoutes.REGISTER_PAGE: (ctx) => RegisterPage(),
      },
    );
  }
}

