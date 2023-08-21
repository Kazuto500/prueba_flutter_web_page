import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/user_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';
import 'package:prueba_flutter_web_page/theme/platform_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: "sdlpcuecem@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "0170d0i2c");
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
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            Consumer2<SessionController, UserController>(
              builder: (context, sessionController, userController, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      sessionController.login(
                        email: emailController.value.text.trim(),
                        password: passwordController.value.text.trim(),
                        onSuccess: (data) {
                          userController.setCurrentUser(data: data);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "dashboard", (route) => false);
                        },
                      );
                    }
                  },
                  child: const Text("Login"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
