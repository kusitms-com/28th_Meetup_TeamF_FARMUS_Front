import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/community_detail_controller.dart';

class BottomComment extends StatefulWidget {
  @override
  State<BottomComment> createState() => _BottomCommentState();
}

final int maxLength = 100;

class _BottomCommentState extends State<BottomComment> {
  final CommunityDetailController _controller =
      Get.put(CommunityDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityDetailController>(
      builder: (_) {
        return Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '댓글을 입력하세요',
                  hintStyle: TextStyle(
                    color: FarmusThemeData.dark.withOpacity(0.3),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  counterText: "",
                  filled: true,
                  fillColor: FarmusThemeData.background,
                  suffix: Obx(() => Text(
                      "${_controller.textValue.value.length} / $maxLength")),
                  suffixStyle: TextStyle(
                    color: FarmusThemeData.dark.withOpacity(0.3),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/image/ic_arrow_up.svg",
                    ),
                  ),
                ),
                maxLength: maxLength,
                onChanged: _controller.updateTextValue,
              ),
            ),
          ],
        );
      },
    );
  }
}
