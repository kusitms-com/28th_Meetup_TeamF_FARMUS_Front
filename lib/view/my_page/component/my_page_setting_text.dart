import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class MyPageSettingText extends StatefulWidget {
  final String text;
  final Function()? onPress;

  const MyPageSettingText({super.key, required this.text, this.onPress});

  @override
  State<MyPageSettingText> createState() => _MyPageSettingTextState();
}

class _MyPageSettingTextState extends State<MyPageSettingText> {
  BottomSheetController controller = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: widget.onPress != null ? widget.onPress : () {},
            child: Text(
              widget.text,
              style: FarmusThemeData.darkStyle16,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
