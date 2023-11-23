import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bottom_sheet/bottom_sheet_farmclub_exit.dart';
import 'package:mojacknong_android/common/bottom_sheet/bottom_sheet_farmclub_join.dart';
import 'package:mojacknong_android/common/bottom_sheet/cupertino_action_sheet_helper.dart';
import 'package:mojacknong_android/common/dialog/Dialog_join_farmclub.dart';
import 'package:mojacknong_android/common/dialog/dialog_mission_farmclub.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/customs/Dialog_register_vege.dart';

import '../../view/farmclub/BottomSheetFinal/farmclub_finish_bottom_sheet.dart';

class BottomSheetController extends GetxController {
  void showActionSheetComment(
    BuildContext? context, {
    required String message,
    required String cancelText,
    required String confirmText,
  }) {
    CupertinoActionSheetHelper.showActionSheetComment(context,
        message: message, cancelText: cancelText, confirmText: confirmText);
  }

  void showActionSheetRedMessage(
    BuildContext? context, {
    String? title,
    required String message,
    required String confirmText,
    required String cancelButtonText,
  }) {
    CupertinoActionSheetHelper.showActionSheetRedMessage(context!,
        message: message,
        confirmText: confirmText,
        cancelText: cancelButtonText);
  }

  void showCustomCupertinoActionSheet(
    BuildContext? context, {
    required String message,
    required List<String> options,
    List<Function()>? optionsAction,
    required String cancelButtonText,
  }) {
    CupertinoActionSheetHelper.showCustomCupertinoActionSheet(
      context!,
      message: message,
      options: options,
      optionActions: optionsAction ?? [],
      cancelButtonText: cancelButtonText,
    );
  }

  void showUserDeleteCupertinoActionSheet(
    BuildContext? context, {
    required String message,
    required List<String> options,
    List<Function()>? optionsAction,
    required String cancelButtonText,
  }) {
    CupertinoActionSheetHelper.showUserDeleteCupertinoActionSheet(
      context!,
      message: message,
      options: options,
      optionActions: optionsAction ?? [],
      cancelButtonText: cancelButtonText,
    );
  }

  void showFarmclubJoinBottomSheet(BuildContext context, String challengeId) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: FarmusThemeData.white,
      builder: (BuildContext context) {
        return BottomSheetFarmclubJoin(
          challengeId: challengeId,
        );
      },
    );
  }

  void showFarmclubExitBottomSheet(BuildContext context, String title) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: FarmusThemeData.white,
      builder: (BuildContext context) {
        return const BottomSheetFarmclubExit();
      },
    );
  }

  void showJoinDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      barrierColor: FarmusThemeData.grey2,
      builder: (BuildContext context) {
        return DialogJoinFarmclub(
          image: "",
          title: title,
          content: "팜클럽에 가입했어요",
        );
      },
    );
  }

  void showAuthDialog(
      BuildContext context, String image, String title, String step) {
    showDialog<void>(
      context: context,
      barrierColor: FarmusThemeData.grey2,
      builder: (BuildContext context) {
        return DialogMissionStepFarmclub(
          image: image,
          title: title,
          step: step,
        );
      },
    );
  }

  void showRegisterDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      barrierColor: FarmusThemeData.grey2,
      builder: (BuildContext context) {
        return DialogRegisterVege(
          title: title,
        );
      },
    );
  }


  void showMissionFinishDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      barrierColor: FarmusThemeData.grey2,
      builder: (BuildContext context) {
        return BottomSheetFarmClubClear(imagePath: "assets/image/ic_lettuce_blue.svg", textContent: title);
      },
    );
  }
}
