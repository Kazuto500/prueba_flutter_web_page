import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/ui/lateral_menu/top_bar/elements/top_bar_button_widget.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Color(0xffe7e7e7),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopBarButton(
              isSelected: true,
              iconRoute: "assets/lmi1.jpg",
              name: "Boxes",
            ),
          ],
        ),
      ),
    );
  }
}
