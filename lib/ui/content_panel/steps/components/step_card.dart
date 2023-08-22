import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/steps/dialogs/delete_step_dialog.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/steps/dialogs/edit_step_dialog.dart';

class StepCard extends StatelessWidget {
  final int index;
  final int stepId;
  final String name;
  final String description;
  const StepCard({
    super.key,
    required this.index,
    required this.stepId,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: insideOnPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                  fontWeight:
                      Theme.of(context).textTheme.headlineLarge!.fontWeight,
                  color: onPrimaryTextColor,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.titleLarge!.fontWeight,
                        color: onPrimaryTextColor.withOpacity(0.75),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.labelLarge!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.labelLarge!.fontWeight,
                        color: onPrimaryTextColor.withOpacity(0.5),
                      ),
                    ),
                  ],
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
                color: primaryColor,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: primaryColor,
                        child: EditStepDialog(
                          stepId: stepId,
                          stepName: name,
                          stepDescription: description,
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
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Material(
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
                        child: DeleteStepDialog(
                          stepId: stepId,
                          stepName: name,
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
            ),
          ],
        ),
      ),
    );
  }
}
