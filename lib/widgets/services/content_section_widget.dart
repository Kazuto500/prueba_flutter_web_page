import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/content/categories_bar/elements/categories_bar.dart';
import 'package:prueba_flutter_web_page/content/categories_searchbar/elements/categories_searchbar.dart';
import 'package:prueba_flutter_web_page/widgets/services/services_widget.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
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
            const Services(),
          ],
        ),
      ),
    );
  }
}
