import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/navigator_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/dialogs/delete_box_dialog.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/dialogs/edit_box_dialog.dart';

class BoxCard extends StatelessWidget {
  final int boxId;
  final String image;
  final String name;
  final String description;
  final Color sectionColor, labelColor, iconBackgroundColor, iconColor;
  final bool isRated;
  const BoxCard({
    Key? key,
    required this.boxId,
    required this.image,
    required this.name,
    required this.description,
    required this.sectionColor,
    required this.labelColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.isRated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: sectionColor,
      child: Stack(
        children: [
          if (isRated)
            Positioned(
              left: 16,
              top: 0,
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "/assets/lmpp.jpg",
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 120,
                child: Image.network(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontWeight,
                                color: labelColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            clipBehavior: Clip.antiAlias,
                            color: iconBackgroundColor,
                            child:
                                Consumer2<NavigatorController, BoxController>(
                              builder: (context, navigatorController,
                                      boxController, child) =>
                                  IconButton(
                                onPressed: () {
                                  boxController.setCurrentBoxId(
                                    newBoxId: boxId,
                                  );
                                  navigatorController.navigateToRoute(
                                    route: "Aps",
                                  );
                                },
                                icon: Icon(
                                  Icons.play_arrow_rounded,
                                  color: iconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            clipBehavior: Clip.antiAlias,
                            color: iconBackgroundColor,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: primaryColor,
                                    child: EditBoxDialog(
                                      boxId: boxId,
                                      boxImageUrl: image,
                                      boxName: name,
                                      boxDescription: description,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: iconColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: iconBackgroundColor,
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.white,
                                    child: DeleteBoxDialog(
                                      boxId: boxId,
                                      boxName: name,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: iconColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        description,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelLarge!.fontSize,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .fontWeight,
                          color: labelColor.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
