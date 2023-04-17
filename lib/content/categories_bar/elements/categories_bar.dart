import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/content/categories_bar/elements/categories_bar_dropdown.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int securitySpace = (size.width > 650) ? 354 : 0;
    return StaggeredGrid.count(
      crossAxisCount: (size.width - securitySpace > 960)
          ? 6
          : (size.width - securitySpace > 650)
              ? 4
              : (size.width - securitySpace > 500)
                  ? 3
                  : (size.width - securitySpace > 350)
                      ? 2
                      : 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: const [
        CategoryDropdown(
          label: "Growth",
          iconPath: Icon(Icons.airline_stops_rounded),
        ),
        CategoryDropdown(
          label: "Instant",
          iconPath: Icon(Icons.track_changes_rounded),
        ),
        CategoryDropdown(
          label: "Lifestyle",
          iconPath: Icon(Icons.headset),
        ),
        CategoryDropdown(
          label: "inspirational",
          iconPath: Icon(Icons.lightbulb_outline_rounded),
        ),
        CategoryDropdown(
          label: "Experience",
          iconPath: Icon(Icons.blur_circular_rounded),
        ),
        CategoryDropdown(
          label: "Together",
          iconPath: Icon(Icons.handshake_rounded),
        ),
      ],
    );
  }
}
