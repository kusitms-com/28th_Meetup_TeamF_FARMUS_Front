import 'package:flutter/cupertino.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class CupertinoActionSheetHelper {
  BottomSheetController bottomSheetController = BottomSheetController();

  static void showActionSheetComment(
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

  static void showActionSheetRedMessage(
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
              Navigator.pop(context);
            },
            child: Text(
              confirmText,
              style: const TextStyle(
                color: FarmusThemeData.red,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
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
        ],
      ),
    );
  }

  static void showCustomCupertinoActionSheet(
    BuildContext context, {
    required String message,
    required List<String> options,
    List<Function>? optionActions,
    required String cancelButtonText,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: Text(
          message,
          style: const TextStyle(
            color: FarmusThemeData.grey2,
            fontSize: 12,
            fontFamily: "Pretendard",
          ),
        ),
        actions: List.generate(
          options.length,
          (index) => CupertinoActionSheetAction(
            onPressed: () {
              if (optionActions != null && optionActions.isNotEmpty) {
                optionActions[index]();
              }
              Navigator.pop(context);
            },
            child: Text(
              options[index],
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
        ),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
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

  static void showCustomCupertinoActionRedSheet(
    BuildContext context, {
    String? title,
    required String message,
    required List<String> options,
    List<Function()>? optionActions,
    required String cancelButtonText,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
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
        actions: List.generate(
          options.length,
          (index) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              options[index],
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
        ),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
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
}
