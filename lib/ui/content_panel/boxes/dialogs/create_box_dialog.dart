import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class CreateBoxDialog extends StatefulWidget {
  const CreateBoxDialog({super.key});

  @override
  State<CreateBoxDialog> createState() => _CreateBoxDialogState();
}

class _CreateBoxDialogState extends State<CreateBoxDialog> {
  TextEditingController imageController = TextEditingController(
      text:
          "https://images.unsplash.com/photo-1504805572947-34fad45aed93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y292ZXIlMjBwaG90b3N8ZW58MHx8MHx8fDA%3D&w=1000&q=80");
  TextEditingController nameController =
      TextEditingController(text: "Box de prueba #");
  TextEditingController descriptionController =
      TextEditingController(text: "Descripción del box #");
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
                    child: Text("Create box"),
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
                              boxController.createBox(
                                sessionKey: sessionController.sessionKey!,
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
                          child: const Text("Create"),
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
