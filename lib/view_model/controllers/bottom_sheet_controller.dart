import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/around/bottom_sheet_farmclub_join.dart';

class BottomSheetController extends GetxController {
  final isBottomSheetOpen = false.obs;

  void openBottomSheet() {
    isBottomSheetOpen.value = true;
  }

  void closeBottomSheet() {
    isBottomSheetOpen.value = false;
  }

  void showActionSheetComment(
    BuildContext? context, {
    required String message,
    required String cancelText,
    required String confirmText,
  }) {
    showCupertinoModalPopup<void>(
      context: context!,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: Text(
          message,
          style: const TextStyle(
            color: FarmusThemeData.grey2,
            fontSize: 12,
            fontFamily: "Pretendard",
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              closeBottomSheet();
              Navigator.pop(context);
            },
            child: Text(
              cancelText,
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              closeBottomSheet();
              Navigator.pop(context);
            },
            child: Text(
              confirmText,
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCustomCupertinoActionSheet(
    BuildContext? context, {
    String? title,
    required String message,
    required List<String> options,
    required String cancelButtonText,
  }) {
    showCupertinoModalPopup<String>(
      context: context!,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: Text(
          message,
          style: const TextStyle(
            color: FarmusThemeData.grey2,
            fontSize: 12,
            fontFamily: "Pretendard",
          ),
        ),
        actions: List<Widget>.generate(options.length, (index) {
          return CupertinoActionSheetAction(
            child: Text(
              options[index],
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
            onPressed: () {
              Navigator.pop(context, options[index]);
            },
          );
        }),
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, cancelButtonText);
          },
          child: Text(
            cancelButtonText,
            style: const TextStyle(
              color: FarmusThemeData.dark,
              fontSize: 14,
              fontFamily: "Pretendard",
            ),
          ),
        ),
      ),
    );
  }

  void showFarmclubJoinBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: FarmusThemeData.white,
      builder: (BuildContext context) {
        return BottomSheetFarmclubJoin();
      },
    );
  }
}
