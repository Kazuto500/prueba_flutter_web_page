import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/ui/pages/login/login_page.dart';
import 'package:prueba_flutter_web_page/ui/pages/register/register_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    //
                    showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                        backgroundColor: Colors.white,
                        child: RegisterPage(),
                      ),
                    );
                  },
                  child: const Text("Register"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    //
                    showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                        backgroundColor: Colors.white,
                        child: LoginPage(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
