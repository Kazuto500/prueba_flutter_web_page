import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/components/ap_card.dart';

class ActionPowersList extends StatefulWidget {
  const ActionPowersList({super.key});

  @override
  State<ActionPowersList> createState() => _ActionPowersListState();
}

class _ActionPowersListState extends State<ActionPowersList> {
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    return Consumer2<SessionController, BoxController>(
        builder: (context, sessionController, boxController, child) {
      if (!initialized &&
          (boxController.previewBoxId == null ||
              boxController.previewBoxId! != boxController.currentBoxId)) {
        boxController.setPreviewBoxId(
          boxId: boxController.currentBoxId!,
        );
        boxController.getAPs(
          sessionKey: sessionController.sessionKey!,
          initialized: initialized,
        );
        initialized = true;
      }

      if (boxController.isGettingAPs) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!boxController.isGettingAPs &&
          boxController.currentAPs!.isEmpty) {
        return const Center(
          child: Text("No tienes Action Powers en este box, crea uno"),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StaggeredGrid.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 1,
            children: List.generate(
              boxController.currentAPs!.length,
              (index) => ActionPowerCard(
                aPId: boxController.currentAPs![index].id,
                image: boxController.currentAPs![index].image,
                name: boxController.currentAPs![index].name,
                description: boxController.currentAPs![index].description,
              ),
            ),
          ),
        );
      }
    });
  }
}
