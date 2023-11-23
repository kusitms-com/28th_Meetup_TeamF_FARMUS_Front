import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeSelectBox extends StatelessWidget {
  final String title;
  final RxBool isSelected;
  final Function() selectBox;

  const HomeSelectBox({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.selectBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Color backgroundColor = isSelected.value
            ? FarmusThemeData.greenLight
            : FarmusThemeData.white;
        Color titleColor =
            isSelected.value ? FarmusThemeData.dark : FarmusThemeData.dark;

        return Bouncing(
          onPress: () {},
          child: GestureDetector(
            onTap: selectBox,
            child: Container(
              width: double.infinity,
              height: 82,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: isSelected.value
                      ? FarmusThemeData.green1
                      : FarmusThemeData.grey4,
                ),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
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
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
