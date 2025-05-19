import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviesapp/theme/app_theme.dart';
import 'package:moviesapp/ui/home_page.dart';
import 'package:moviesapp/ui/login_page.dart';
import 'package:moviesapp/ui/register_page.dart';
import 'package:moviesapp/ui/search_page.dart';
import 'package:moviesapp/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();

  //Apenas modo portrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        AppRoutes.HOME_PAGE: (ctx) => HomePage(),
        AppRoutes.SEARCH_PAGE: (ctx) => SearchPage(),
      },
    );
  }
}
