import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/steps/components/step_card.dart';

class StepsList extends StatefulWidget {
  const StepsList({super.key});

  @override
  State<StepsList> createState() => _StepsListState();
}

class _StepsListState extends State<StepsList> {
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    return Consumer2<SessionController, BoxController>(
        builder: (context, sessionController, boxController, child) {
      //APId

      if (!initialized &&
          (boxController.previewAPId == null ||
              boxController.previewAPId! != boxController.currentAPId)) {
        boxController.setPreviewAPId(
          aPId: boxController.currentAPId!,
        );
        boxController.getSteps(
          sessionKey: sessionController.sessionKey!,
          initialized: initialized,
        );
        initialized = true;
      }

      if (boxController.isGettingSteps) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!boxController.isGettingSteps &&
          boxController.currentSteps!.isEmpty) {
        return const Center(
          child: Text("No tienes Steps en este Action Power, crea uno"),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StaggeredGrid.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 1,
            children: List.generate(
              boxController.currentSteps!.length,
              (index) => StepCard(
                index: index + 1,
                stepId: boxController.currentSteps![index].id,
                name: boxController.currentSteps![index].name,
                description: boxController.currentSteps![index].description,
              ),
            ),
          ),
        );
      }
    });
  }
}
