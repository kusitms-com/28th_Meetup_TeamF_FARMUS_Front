import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityDetailController extends GetxController {
  final textValue = "".obs;
  final isBottomSheetOpen = false.obs;

  void openBottomSheet() {
    isBottomSheetOpen.value = true;
  }

  void closeBottomSheet() {
    isBottomSheetOpen.value = false;
  }

  void updateTextValue(String value) {
    textValue.value = value;
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
          style: TextStyle(
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
              style: TextStyle(
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
              style: TextStyle(
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
}
