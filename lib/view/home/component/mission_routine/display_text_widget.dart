import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class DisplayTextWidget extends StatefulWidget {
  final TextEditingController textFieldController;
  final VoidCallback? onKebabTapped;
  final String text;

  const DisplayTextWidget({
    Key? key,
    required this.textFieldController,
    this.onKebabTapped,
    required this.text,
  }) : super(key: key);

  @override
  State<DisplayTextWidget> createState() => _DisplayTextWidgetState();
}

class _DisplayTextWidgetState extends State<DisplayTextWidget> {
  late FarmclubController _farmclubController;
  late BottomSheetController _bottomSheetController = BottomSheetController();

  @override
  void initState() {
    super.initState();
    _farmclubController = FarmclubController();
    _bottomSheetController = BottomSheetController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: [
              if (widget.textFieldController.text.isNotEmpty)
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
              Text(
                widget.textFieldController.text,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        trailing: widget.textFieldController.text.isNotEmpty
            ? InkWell(
                onTap: widget.onKebabTapped ??
                    () {
                      print("Default Kebab Tapped!");
                      _bottomSheetController.showActionSheetComment(
                        context,
                        message: "골라 골라?",
                        cancelText: "취소",
                        confirmText: "확인",
                      );
                    },
                child: const Icon(Icons.more_vert,
                    size: 22, color: FarmusThemeData.dark),
              )
            : const SizedBox(), // Hidden if there is no text
      ),
    );
  }
}
