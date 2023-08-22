import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/content/categories_bar/elements/categories_bar.dart';
import 'package:prueba_flutter_web_page/content/categories_searchbar/elements/categories_searchbar.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/dialogs/create_box_dialog.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/components/boxes_list.dart';

class BoxesPanel extends StatelessWidget {
  const BoxesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Explore Your Personal Interests",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
            color: const Color(0xff06d199),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const CategoriesBar(),
        const SizedBox(
          height: 16,
        ),
        const CategoriesSearchBar(),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(48, 48),
                ),
                backgroundColor: MaterialStateProperty.all(
                  secondaryAlternColor,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    backgroundColor: Colors.white,
                    child: CreateBoxDialog(),
                  ),
                );
              },
              child: const Text(
                "Add Box",
              ),
            ),
          ),
        ),
        const BoxesList(),
      ],
    );
  }
}
