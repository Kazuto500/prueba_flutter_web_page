import 'dart:convert';

import 'package:http/http.dart' as http;

class QueryController {
  final String _domainRoute = "278c-190-0-241-189.ngrok-free.app";

  String get registerApiRoute => "/api/register";
  String get loginApiRoute => "/api/login";
  String get logoutApiRoute => "/api/logout";

  String get boxesApiRoute => "/api/boxes";
  String get actionPowersApiRoute => "/powers";
  String get aPStepsApiRoute => "/steps";

  getQuery({
    String? sessionKey,
    required String apiRoute,
    Map<String, String>? parameters,
    Function? onStart,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function onError,
    required Function onNetworkError,
    Function? onComplete,
  }) async {
    try {
      onStart?.call();
      await http.get(
        Uri.https(
          _domainRoute,
          apiRoute,
          parameters,
        ),
        headers: {
          'Authorization': 'Bearer $sessionKey',
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body);
            onSuccess(data);
          } else {
            onError();
          }
          onComplete?.call();
        },
      );
    } catch (e) {
      onComplete?.call();
      onNetworkError();
    }
  }

  postQuery({
    String? sessionKey,
    required String apiRoute,
    Map<String, String>? parameters,
    Function? onStart,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function onError,
    required Function onNetworkError,
    Function? onComplete,
  }) async {
    try {
      onStart?.call();
      await http.post(
        Uri.https(
          _domainRoute,
          apiRoute,
          parameters,
        ),
        headers: {
          'Authorization': 'Bearer $sessionKey',
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body);
            onSuccess(data);
          } else {
            onError();
          }
          onComplete?.call();
        },
      );
    } catch (e) {
      onComplete?.call();
      onNetworkError();
    }
  }

  putQuery({
    String? sessionKey,
    required String apiRoute,
    Map<String, String>? parameters,
    Function? onStart,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function onError,
    required Function onNetworkError,
    Function? onComplete,
  }) async {
    try {
      onStart?.call();
      await http.put(
        Uri.https(
          _domainRoute,
          apiRoute,
          parameters,
        ),
        headers: {
          'Authorization': 'Bearer $sessionKey',
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body);
            onSuccess(data);
          } else {
            onError();
          }
          onComplete?.call();
        },
      );
    } catch (e) {
      onComplete?.call();
      onNetworkError();
    }
  }

  deleteQuery({
    String? sessionKey,
    required String apiRoute,
    Map<String, String>? parameters,
    Function? onStart,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function onError,
    required Function onNetworkError,
    Function? onComplete,
  }) async {
    try {
      onStart?.call();
      await http.delete(
        Uri.https(
          _domainRoute,
          apiRoute,
          parameters,
        ),
        headers: {
          'Authorization': 'Bearer $sessionKey',
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body);
            onSuccess(data);
          } else {
            onError();
          }
          onComplete?.call();
        },
      );
    } catch (e) {
      onComplete?.call();
      onNetworkError();
    }
  }
}
