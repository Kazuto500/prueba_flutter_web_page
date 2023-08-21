import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/box_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(hintText: "Image url"),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Box name"),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Box description"),
            ),
            Consumer2<SessionController, BoxController>(
              builder: (context, sessionController, boxController, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      boxController.createBox(
                        sessionKey: sessionController.sessionKey!,
                        image: imageController.value.text.trim(),
                        name: nameController.value.text.trim(),
                        description: descriptionController.value.text.trim(),
                        onSuccess: () {
                          Navigator.of(context).pop();
                          boxController.getBoxes(
                              sessionKey: sessionController.sessionKey!);
                        },
                      );
                    }
                  },
                  child: const Text("Register"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
