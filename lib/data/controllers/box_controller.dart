import 'package:flutter/material.dart';
import 'package:prueba_flutter_web_page/data/controllers/query_controller.dart';
import 'package:prueba_flutter_web_page/data/models/ap.dart';
import 'package:prueba_flutter_web_page/data/models/step.dart';

import '../models/box.dart';

class BoxController extends QueryController with ChangeNotifier {
  bool boxesControllerInitialized = false;
  bool isGettingBoxes = true;
  List<BoxModel>? currentBoxes;

  getBoxes({required String sessionKey}) {
    getQuery(
      apiRoute: boxesApiRoute,
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
      apiRoute: boxesApiRoute,
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

  editBox({
    required String sessionKey,
    required int boxId,
    required String image,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    putQuery(
      apiRoute: "$boxesApiRoute/$boxId",
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

  deleteBox({
    required String sessionKey,
    required int boxId,
    required Function onSuccess,
  }) {
    deleteQuery(
      apiRoute: "$boxesApiRoute/$boxId",
      sessionKey: sessionKey,
      onSuccess: (_) {
        onSuccess();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }

  int? currentBoxId;
  int? previewBoxId;
  int? currentAPId;
  int? previewAPId;

  // int? currentStepsId;
  // int? previewStepsId;

  setCurrentBoxId({required int newBoxId}) {
    currentBoxId = newBoxId;
  }

  setPreviewBoxId({required int boxId}) {
    previewBoxId = boxId;
  }

  setCurrentAPId({required int aPId}) {
    currentAPId = aPId;
  }

  setPreviewAPId({required int aPId}) {
    currentAPId = aPId;
  }

  bool isGettingAPs = true;
  List<APModel>? currentAPs;

  getAPs({
    required String sessionKey,
    required bool initialized,
  }) {
    getQuery(
      apiRoute: "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute",
      sessionKey: sessionKey,
      onStart: () {
        isGettingAPs = true;
        if (initialized) {
          notifyListeners();
        }
      },
      onSuccess: (data) {
        if (data["data"].isNotEmpty) {
          currentAPs = List<APModel>.generate(
            data["data"].length,
            (index) => APModel.fromJson(
              data["data"][index],
            ),
          );
        } else {
          currentAPs = [];
        }
      },
      onComplete: () {
        isGettingAPs = false;
        notifyListeners();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }

  createAP({
    required String sessionKey,
    required String image,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    postQuery(
      apiRoute: "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute",
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

  editAP({
    required String sessionKey,
    required int aPId,
    required String image,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    putQuery(
      apiRoute: "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/$aPId",
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

  deleteAP({
    required String sessionKey,
    required int aPId,
    required Function onSuccess,
  }) {
    deleteQuery(
      apiRoute: "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/$aPId",
      sessionKey: sessionKey,
      onSuccess: (_) {
        onSuccess();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }

  //

  bool isGettingSteps = true;
  List<StepModel>? currentSteps;

  getSteps({
    required String sessionKey,
    required bool initialized,
  }) {
    getQuery(
      apiRoute:
          "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/${currentAPId!}$aPStepsApiRoute",
      sessionKey: sessionKey,
      onStart: () {
        isGettingSteps = true;
        if (initialized) {
          notifyListeners();
        }
      },
      onSuccess: (data) {
        if (data["data"].isNotEmpty) {
          currentSteps = List<StepModel>.generate(
            data["data"].length,
            (index) => StepModel.fromJson(
              data["data"][index],
            ),
          );
        } else {
          currentSteps = [];
        }
      },
      onComplete: () {
        isGettingSteps = false;
        notifyListeners();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }

  createStep({
    required String sessionKey,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    postQuery(
      apiRoute:
          "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/${currentAPId!}$aPStepsApiRoute",
      sessionKey: sessionKey,
      parameters: {
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

  editStep({
    required String sessionKey,
    required int stepId,
    required String name,
    required String description,
    required Function onSuccess,
  }) {
    putQuery(
      apiRoute:
          "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/${currentAPId!}$aPStepsApiRoute/$stepId",
      sessionKey: sessionKey,
      parameters: {
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

  deleteStep({
    required String sessionKey,
    required int stepId,
    required Function onSuccess,
  }) {
    deleteQuery(
      apiRoute:
          "$boxesApiRoute/${currentBoxId!}$actionPowersApiRoute/${currentAPId!}$aPStepsApiRoute/$stepId",
      sessionKey: sessionKey,
      onSuccess: (_) {
        onSuccess();
      },
      onError: () {},
      onNetworkError: () {},
    );
  }
}
