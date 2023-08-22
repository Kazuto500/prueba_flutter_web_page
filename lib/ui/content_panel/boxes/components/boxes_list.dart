import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/components/box_card.dart';

class BoxesList extends StatelessWidget {
  const BoxesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int securitySpace = (size.width > 680) ? 354 : 0;
    return Consumer2<SessionController, BoxController>(
        builder: (context, sessionController, boxController, child) {
      if (!boxController.boxesControllerInitialized) {
        boxController.getBoxes(sessionKey: sessionController.sessionKey!);
      }

      if (boxController.isGettingBoxes) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!boxController.isGettingBoxes &&
          boxController.currentBoxes!.isEmpty) {
        return const Center(
          child: Text("No tienes boxes, crea uno"),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StaggeredGrid.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: (size.width - securitySpace > 500) ? 2 : 1,
            children: List.generate(
              boxController.currentBoxes!.length,
              (index) => BoxCard(
                boxId: boxController.currentBoxes![index].id,
                image: boxController.currentBoxes![index].image,
                name: boxController.currentBoxes![index].name,
                description: boxController.currentBoxes![index].description,
                sectionColor: const Color(0xff044a88),
                labelColor: const Color(0xffffffff),
                iconBackgroundColor: const Color(0xffffffff),
                iconColor: const Color(0xff044a88),
                isRated: false,
              ),
            ),
          ),
        );
      }
    });
  }
}
