import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class SelectBox extends StatelessWidget {
  final String title;
  final String content;
  final RxBool isSelected;

  const SelectBox({
    Key? key,
    required this.title,
    required this.content,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Color backgroundColor =
            isSelected.value ? FarmusThemeData.primary : FarmusThemeData.white;
        Color titleColor =
            isSelected.value ? FarmusThemeData.white : FarmusThemeData.dark;
        Color contentColor =
            isSelected.value ? FarmusThemeData.white : FarmusThemeData.grey1;

        return Container(
          width: double.infinity,
          height: 82,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: FarmusThemeData.grey3,
            ),
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Pretendard",
                  color: contentColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
