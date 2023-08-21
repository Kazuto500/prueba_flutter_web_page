import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/data/controllers/query_controller.dart';

class SessionController extends QueryController with ChangeNotifier {
  String? sessionKey;

  register({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
  }) {
    postQuery(
      apiRoute: registerApiRoute,
      parameters: {
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "email": email,
        "password": password,
      },
      onStart: () {
        isLoggingSession = true;
      },
      onSuccess: (data) {},
      onComplete: () {
        isLoggingSession = false;
      },
      onError: () {
        //
      },
      onNetworkError: () {
        //
      },
    );
  }

  bool isLoggingSession = false;

  login({
    required String email,
    required String password,
    required Function(Map<String, dynamic> data) onSuccess,
  }) {
    postQuery(
      apiRoute: loginApiRoute,
      parameters: {
        "email": email,
        "password": password,
      },
      onStart: () {
        isLoggingSession = true;
      },
      onSuccess: (data) {
        sessionKey = data["accessToken"];
        onSuccess(data["user"]);
      },
      onComplete: () {
        isLoggingSession = false;
      },
      onError: () {
        //
      },
      onNetworkError: () {
        //
      },
    );
  }

  logout({required Function onSuccess}) {
    postQuery(
      sessionKey: sessionKey!,
      apiRoute: logoutApiRoute,
      onSuccess: (data) {
        //
        onSuccess();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }
}
