import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/navigator_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/components/aps_list.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/dialogs/create_ap_dialog.dart';

class ActionPowersPanel extends StatelessWidget {
  const ActionPowersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<NavigatorController>(
              builder: (context, navigatorController, child) => ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: const BorderSide(color: onPrimaryTextColor),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    const Size(48, 48),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    primaryColor,
                  ),
                  foregroundColor:
                      MaterialStateProperty.all(onPrimaryTextColor),
                ),
                onPressed: () {
                  navigatorController.navigateToRoute(route: "Boxes");
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Back",
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(48, 48),
                ),
                backgroundColor:
                    MaterialStateProperty.all(secondaryAlternColor),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    backgroundColor: primaryColor,
                    child: CreateAPDialog(),
                  ),
                );
              },
              child: const Text(
                "Add AP",
              ),
            ),
          ],
        ),
        const ActionPowersList(),
      ],
    );
  }
}
