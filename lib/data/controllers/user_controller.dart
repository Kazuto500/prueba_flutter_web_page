import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/data/controllers/query_controller.dart';
import 'package:prueba_flutter_web_page/data/models/user.dart';

class UserController extends QueryController with ChangeNotifier {
  UserModel? currentUser;

  setCurrentUser({required Map<String, dynamic> data}) {
    currentUser = UserModel.fromJson(data);
  }
}
