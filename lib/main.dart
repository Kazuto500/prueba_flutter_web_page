import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/user_controller.dart';
import 'package:prueba_flutter_web_page/data/navigator_controller.dart';
import 'package:prueba_flutter_web_page/ui/pages/landing/landing_page.dart';
import 'package:prueba_flutter_web_page/ui/pages/login/login_page.dart';
import 'package:prueba_flutter_web_page/ui/pages/register/register_page.dart';
import 'package:prueba_flutter_web_page/widgets/homepage_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SessionController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigatorController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoxController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "landing": (context) => const LandingPage(),
          "login": (context) => const LoginPage(),
          "register": (context) => const RegisterPage(),
          "dashboard": (context) => const HomePage(
                userImageUrl: 'assets/lmpp.jpg',
              ),
        },
        title: 'Web Page',
        theme: ThemeData(),
        initialRoute: "landing",
      ),
    );
  }
}
