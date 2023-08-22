import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class EditBoxDialog extends StatefulWidget {
  final int boxId;
  final String boxImageUrl;
  final String boxName;
  final String boxDescription;
  const EditBoxDialog({
    super.key,
    required this.boxId,
    required this.boxImageUrl,
    required this.boxName,
    required this.boxDescription,
  });

  @override
  State<EditBoxDialog> createState() => _EditBoxDialogState();
}

class _EditBoxDialogState extends State<EditBoxDialog> {
  late TextEditingController imageController =
      TextEditingController(text: widget.boxImageUrl);
  late TextEditingController nameController =
      TextEditingController(text: widget.boxName);
  late TextEditingController descriptionController =
      TextEditingController(text: widget.boxDescription);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  InputDecoration getInputDecoration({required String label}) {
    return InputDecoration(
      hintText: label,
      label: Text(label),
      filled: true,
      fillColor: primaryColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      isCollapsed: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            color: onPrimaryColor,
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Edit box"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: imageController,
                        decoration: getInputDecoration(label: "Image url")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: nameController,
                        decoration: getInputDecoration(label: "Box name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: descriptionController,
                        decoration:
                            getInputDecoration(label: "Box description")),
                  ),
                  Consumer2<SessionController, BoxController>(
                    builder:
                        (context, sessionController, boxController, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //
                              boxController.editBox(
                                sessionKey: sessionController.sessionKey!,
                                boxId: widget.boxId,
                                image: imageController.value.text.trim(),
                                name: nameController.value.text.trim(),
                                description:
                                    descriptionController.value.text.trim(),
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                  boxController.getBoxes(
                                      sessionKey:
                                          sessionController.sessionKey!);
                                },
                              );
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                          child: const Text("Save"),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Consumer2<SessionController, BoxController>(
//                 builder: (context, sessionController, boxController, child) =>
//                     ElevatedButton(
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                     minimumSize: MaterialStateProperty.all(
//                       const Size(48, 48),
//                     ),
//                     backgroundColor: MaterialStateProperty.all(
//                       secondaryAlternColor,
//                     ),
//                   ),
//                   onPressed: () {
//                     boxController.deleteBox(
//                       sessionKey: sessionController.sessionKey!,
//                       boxId: boxId,
//                       onSuccess: () {
//                         Navigator.of(context).pop();
//                         boxController.getBoxes(
//                             sessionKey: sessionController.sessionKey!);
//                       },
//                     );
//                   },
//                   child: const Text(
//                     "Eliminar",
//                   ),
//                 ),
//               ),