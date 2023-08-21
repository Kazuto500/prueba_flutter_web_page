import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/data/controllers/query_controller.dart';

import '../models/box.dart';

class BoxController extends QueryController with ChangeNotifier {
  bool boxesControllerInitialized = false;
  bool isGettingBoxes = true;
  List<BoxModel>? currentBoxes;

  getBoxes({required String sessionKey}) {
    getQuery(
      apiRoute: getBoxesApiRoute,
      sessionKey: sessionKey,
      onStart: () {
        isGettingBoxes = true;
        if (boxesControllerInitialized) {
          notifyListeners();
        } else {
          boxesControllerInitialized = true;
        }
      },
      onSuccess: (data) {
        if (data["data"].isNotEmpty) {
          currentBoxes = List<BoxModel>.generate(
            data["data"].length,
            (index) => BoxModel.fromJson(
              data["data"][index],
            ),
          );
        } else {
          currentBoxes = [];
        }
      },
      onComplete: () {
        isGettingBoxes = false;
        notifyListeners();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }

  createBox({
    required String sessionKey,
    required String image,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    postQuery(
      apiRoute: createBoxApiRoute,
      sessionKey: sessionKey,
      parameters: {
        "image": image,
        "name": name,
        "description": description,
      },
      onSuccess: (_) {
        onSuccess();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }
}
