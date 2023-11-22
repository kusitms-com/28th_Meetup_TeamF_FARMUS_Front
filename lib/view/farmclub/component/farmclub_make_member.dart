import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_register_controller.dart';

class FarmclubMakeMember extends StatefulWidget {
  final String hintText;

  const FarmclubMakeMember({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<FarmclubMakeMember> createState() => _FarmclubMakeMemberState();
}

class _FarmclubMakeMemberState extends State<FarmclubMakeMember> {
  FarmclubRegisterController _controller = Get.put(FarmclubRegisterController());
  final int maxLength = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller.memberController,
          maxLength: maxLength,
          cursorColor: FarmusThemeData.grey2,
          onChanged: (value) {
            _controller.updateMemberValue(value);
            _controller.checkMemberValidity();
          },
          style: FarmusThemeData.darkStyle16,
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: FarmusThemeData.grey3,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Pretendard",
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
        ),
        Obx(() {
          if (!_controller.isMemberValid.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '3부터 20까지의 숫자를 입력해주세요',
                style: FarmusThemeData.redStyle,
              ),
            );
          } else {
            return Container(); // 에러가 없을 경우 빈 컨테이너 반환
          }
        }),
      ],
    );
  }
}
