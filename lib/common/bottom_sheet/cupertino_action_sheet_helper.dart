import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/login/login_screen.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

import '../../repository/mypage_repository.dart';

const storage = FlutterSecureStorage();

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
            onPressed: () async {
              try {
                // API 호출 코드
                MypageRepository.logoutApi();

                await storage.delete(key: "refreshToken");
                await storage.delete(key: 'accessToken');

                print(await storage.read(key: "refreshToken"));
                print(await storage.read(key: "accessToken"));

                // API 호출이 완료되면 새로운 화면으로 이동
                await Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => const LoginScreen()), // NewScreen은 이동할 화면의 클래스
                );
              } catch (error) {
                // API 호출 중 오류 처리
                print("API 호출 중 오류 발생: $error");
              }finally {
                // API 호출 완료 후 액션 시트를 닫기
                Navigator.pop(context);
              }
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
