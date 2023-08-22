import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/navigator_controller.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/aps_panel.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/boxes_panel.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/steps/steps_panel.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    Key? key,
  }) : super(key: key);

  getView({required String route}) {
    switch (route) {
      case "Boxes":
        return const BoxesPanel();
      case "Aps":
        return const ActionPowersPanel();
      case "Steps":
        return const StepsPanel();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigatorController>(
      builder: (context, navigationController, child) =>
          getView(route: navigationController.currentRoute),
    );
  }
}
