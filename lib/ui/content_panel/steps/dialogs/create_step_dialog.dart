import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class CreateStepDialog extends StatefulWidget {
  const CreateStepDialog({super.key});

  @override
  State<CreateStepDialog> createState() => _CreateStepDialogState();
}

class _CreateStepDialogState extends State<CreateStepDialog> {
  TextEditingController nameController =
      TextEditingController(text: "Step de prueba #");
  TextEditingController descriptionController =
      TextEditingController(text: "Descripción del step #");
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
                    child: Text("Create step"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: nameController,
                        decoration: getInputDecoration(label: "Step name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: descriptionController,
                        decoration:
                            getInputDecoration(label: "Step description")),
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
                              boxController.createStep(
                                sessionKey: sessionController.sessionKey!,
                                name: nameController.value.text.trim(),
                                description:
                                    descriptionController.value.text.trim(),
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                  boxController.getSteps(
                                    sessionKey: sessionController.sessionKey!,
                                    initialized: true,
                                  );
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
