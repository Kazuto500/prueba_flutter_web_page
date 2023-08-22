import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class DeleteBoxDialog extends StatelessWidget {
  final int boxId;
  final String boxName;
  const DeleteBoxDialog({
    super.key,
    required this.boxId,
    required this.boxName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Delete "$boxName" box?'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
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
                    backgroundColor: MaterialStateProperty.all(
                      onPrimaryAlternTextColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
                Consumer2<SessionController, BoxController>(
                  builder: (context, sessionController, boxController, child) =>
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
                      backgroundColor: MaterialStateProperty.all(
                        secondaryAlternColor,
                      ),
                    ),
                    onPressed: () {
                      boxController.deleteBox(
                        sessionKey: sessionController.sessionKey!,
                        boxId: boxId,
                        onSuccess: () {
                          Navigator.of(context).pop();
                          boxController.getBoxes(
                              sessionKey: sessionController.sessionKey!);
                        },
                      );
                    },
                    child: const Text(
                      "Delete",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
