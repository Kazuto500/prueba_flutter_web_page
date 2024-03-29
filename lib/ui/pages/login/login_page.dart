import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/data/controllers/user_controller.dart';
import 'package:prueba_flutter_web_page/theme/platform_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: getInputDecoration(label: "Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: getInputDecoration(label: "Password"),
                    ),
                  ),
                  Consumer2<SessionController, UserController>(
                    builder:
                        (context, sessionController, userController, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
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
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize: MaterialStateProperty.all(
                              const Size(48, 48),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          child: const Text("Login"),
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
