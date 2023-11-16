import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class TodayRoutineList extends StatefulWidget {
  final String text;
  final VoidCallback? onKebabTapped; // Make the callback optional

  const TodayRoutineList({
    Key? key,
    required this.text,
    this.onKebabTapped, // Optional callback
  }) : super(key: key);

  @override
  State<TodayRoutineList> createState() => _TodayRoutineListState();
}

class _TodayRoutineListState extends State<TodayRoutineList> {
  late FarmclubController _farmclubController;
  late BottomSheetController _bottomSheetController = BottomSheetController();

  @override
  void initState() {
    super.initState();
    _farmclubController = FarmclubController();
    _bottomSheetController = BottomSheetController(); // Create it here
  }

  @override
  Widget build(BuildContext context) {
    print("루틴 체크 박스");
    return SizedBox(
      height: 47, // Adjust the height as needed
      child: ListTile(
        title: Row(
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
            Text(widget.text),
          ],
        ),
        trailing: InkWell(
          onTap: widget.onKebabTapped ??
              () {
                _bottomSheetController.showActionSheetComment(
                  context,
                  message: "골라 골라?",
                  cancelText: "취소",
                  confirmText: "확인",
                );

                print("Default Kebab Tapped!");
              },
          child: const Icon(Icons.more_vert,
              size: 22, color: FarmusThemeData.dark),
        ),
      ),
    );
  }
}
