import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/navigator_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/dialogs/delete_ap_dialog.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/aps/dialogs/edit_ap_dialog.dart';

class ActionPowerCard extends StatelessWidget {
  final int aPId;
  final String image;
  final String name;
  final String description;
  const ActionPowerCard({
    Key? key,
    required this.aPId,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: secondaryAlternColor,
      child: SizedBox(
        height: 168,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontWeight,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Material(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              color: primaryColor,
                              child:
                                  Consumer2<NavigatorController, BoxController>(
                                builder: (context, navigatorController,
                                        boxController, child) =>
                                    IconButton(
                                  onPressed: () {
                                    boxController.setCurrentAPId(
                                      aPId: aPId,
                                    );
                                    navigatorController.navigateToRoute(
                                      route: "Steps",
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.zoom_in,
                                    color: secondaryAlternColor,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              color: primaryColor,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      backgroundColor: primaryColor,
                                      child: EditAPDialog(
                                        aPId: aPId,
                                        boxImageUrl: image,
                                        boxName: name,
                                        boxDescription: description,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: secondaryAlternColor,
                                ),
                              ),
                            ),
                            Material(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: primaryColor,
                              clipBehavior: Clip.antiAlias,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      backgroundColor: Colors.white,
                                      child: DeleteAPDialog(
                                        apName: name,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: secondaryAlternColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 32,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        description,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelLarge!.fontSize,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .fontWeight,
                          color: primaryColor.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
