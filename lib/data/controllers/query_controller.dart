import 'dart:convert';

import 'package:http/http.dart' as http;

class QueryController {
  final String _domainRoute = "4c92-186-84-91-91.ngrok-free.app";

  String get registerApiRoute => "/api/register";
  String get loginApiRoute => "/api/login";
  String get logoutApiRoute => "/api/logout";

  String get getBoxesApiRoute => "/api/boxes";
  String get createBoxApiRoute => "/api/boxes/store";

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
        },
      ).then(
        (response) {
          print(response.statusCode);
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
      print(e);
      onComplete?.call();
      onNetworkError();
    }
  }

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
          print(response.statusCode);
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
