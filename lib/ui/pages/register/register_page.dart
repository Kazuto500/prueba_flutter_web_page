import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              controller: firstNameController,
              decoration: InputDecoration(hintText: "First Name"),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(hintText: "Last Name"),
            ),
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(hintText: "User Name"),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            Consumer<SessionController>(
              builder: (context, sessionController, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      sessionController.register(
                        firstName: firstNameController.value.text.trim(),
                        lastName: lastNameController.value.text.trim(),
                        userName: userNameController.value.text.trim(),
                        email: emailController.value.text.trim(),
                        password: passwordController.value.text.trim(),
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
