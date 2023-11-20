import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';

class CombinedWidget extends StatefulWidget {
  const CombinedWidget({
    Key? key,
    required this.textFieldController,
    required this.onTextSubmitted,
  }) : super(key: key);

  final TextEditingController textFieldController;
  final ValueChanged<String> onTextSubmitted;

  @override
  _CombinedWidgetState createState() => _CombinedWidgetState();
}

class _CombinedWidgetState extends State<CombinedWidget> {
  late FarmclubEtcController _farmclubController;

  void _handleTextSubmission(String text) {
    widget.onTextSubmitted(text);
    widget.textFieldController.clear();
  }

  @override
  void initState() {
    super.initState();
    _farmclubController = FarmclubEtcController();
  }

  @override
  Widget build(BuildContext context) {
    print("루틴 체크 박스");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: FarmusThemeData.grey4,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _farmclubController.toggleSelectCheck();
                    },
                    child: Obx(() {
                      return SvgPicture.asset(
                        _farmclubController.isCheck.value
                            ? "assets/image/ic_check_true.svg"
                            : "assets/image/ic_check_false.svg",
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.textFieldController,
                      onSubmitted: _handleTextSubmission,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        alignLabelWithHint: false,
                        hintText: '루틴을 입력해주세요',
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
