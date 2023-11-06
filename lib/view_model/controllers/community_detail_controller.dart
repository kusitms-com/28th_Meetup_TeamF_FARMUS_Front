import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityDetailController extends GetxController {
  // 텍스트 입력 관리
  final textValue = "".obs;
  // 바텀 시트 관리
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

  void showActionSheetComment(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: Text(
          '댓글을 삭제하시겠어요?',
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
              '취소',
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
              '확인',
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
