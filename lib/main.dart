import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/widgets/homepage_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Page',
      theme: ThemeData(),
      home: const HomePage(
        userImageUrl: 'assets/lmpp.jpg',
      ),
    );
  }
}
