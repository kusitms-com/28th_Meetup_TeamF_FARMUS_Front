import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
import 'package:mojacknong_android/view_model/controllers/community_detail_controller.dart';

class BottomComment extends StatefulWidget {
  final int postingId;
  final VoidCallback? onCommentPosted;

  const BottomComment({
    Key? key,
    required this.postingId,
    this.onCommentPosted,
  }) : super(key: key);

  @override
  State<BottomComment> createState() => _BottomCommentState();
}

final int maxLength = 100;

class _BottomCommentState extends State<BottomComment> {
  final CommunityDetailController _controller =
      Get.put(CommunityDetailController());
  final TextEditingController _textEditingController = TextEditingController();
  final Key _textFormFieldKey = UniqueKey(); // Key 추가

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityDetailController>(
      builder: (_) {
        return Container(
          color: FarmusThemeData.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, bottom: 16.0, right: 16.0),
                child: TextFormField(
                  key: _textFormFieldKey,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText:
                        _textEditingController.text.isEmpty ? '댓글을 입력하세요' : '',
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
                      onPressed: () async {
                        String? result = await postCommentWrite();
                        if (result == "성공") {
                          // 댓글이 성공적으로 추가된 경우 화면 갱신
                          _.update();
                          // 키보드 닫기
                          FocusScope.of(context).unfocus();
                          // 입력 창 초기화
                          _controller.clearTextValue();
                          widget.onCommentPosted?.call();
                        }
                      },
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
          ),
        );
      },
    );
  }

  Future<String?> postCommentWrite() async {
    String? result = await CommunityRepository.postComment(
        widget.postingId, _controller.textValue.value);

    if (result == "성공") {
      // 댓글이 성공적으로 추가된 경우 화면 갱신
      _controller.update();
      // 텍스트 필드 초기화
      _textEditingController.clear();
      widget.onCommentPosted?.call();
    }

    return result;
  }
}
