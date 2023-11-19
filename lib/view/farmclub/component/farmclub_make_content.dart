import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_make_controller.dart';

class FarmclubMakeContent extends StatefulWidget {
  final String hintText;

  const FarmclubMakeContent({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<FarmclubMakeContent> createState() => _FarmclubMakeContentState();
}

class _FarmclubMakeContentState extends State<FarmclubMakeContent> {
  FarmclubMakeController _controller = Get.put(FarmclubMakeController());
  final int maxLength = 20;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller.introController, // 사용할 컨트롤러 연결
      maxLength: 50, // 최대 입력 글자수
      cursorColor: FarmusThemeData.grey2,
      onChanged: _controller.updateContentValue,

      style: FarmusThemeData.darkStyle16,
      decoration: InputDecoration(
        counterText: "", // 빈 문자열로 지정하여 기본 길이 표시를 비활성화
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: FarmusThemeData.grey3,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: "Pretendard",
        ),
        suffix: Obx(
          () => Text(
            "${_controller.contentValue.value.length} / 50",
            style: TextStyle(
              color: FarmusThemeData.dark.withOpacity(0.3),
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: FarmusThemeData.grey4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: FarmusThemeData.grey4,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
