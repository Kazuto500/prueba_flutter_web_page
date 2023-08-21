import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/ui/lateral_menu/bottom_bar/bottom_bar_widget.dart';
import 'package:prueba_flutter_web_page/ui/lateral_menu/profile_resume/profile_resume_widget.dart';
import 'package:prueba_flutter_web_page/ui/lateral_menu/top_bar/top_bar_widget.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 290,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xffb8b8b8), blurRadius: 4),
          ],
          color: Colors.white,
        ),
        child: const Column(
          children: [
            TopBar(),
            ProfileResume(),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
