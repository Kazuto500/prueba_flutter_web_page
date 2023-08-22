import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class DeleteAPDialog extends StatelessWidget {
  final String apName;
  const DeleteAPDialog({
    super.key,
    required this.apName,
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
            child: Text('Delete "$apName" Action Power?'),
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
                      boxController.deleteAP(
                        sessionKey: sessionController.sessionKey!,
                        aPId: boxController.currentBoxId!,
                        onSuccess: () {
                          Navigator.of(context).pop();
                          boxController.getAPs(
                            sessionKey: sessionController.sessionKey!,
                            initialized: true,
                          );
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
