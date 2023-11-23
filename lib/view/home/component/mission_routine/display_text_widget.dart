import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/cycle_setting.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_controller.dart';
import 'package:mojacknong_android/view/home/component/register/controller/buttom_sheet_home.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';

class DisplayTextWidget extends StatefulWidget {
  final TextEditingController textFieldController;
  final VoidCallback? onKebabTapped;
  final int routineId;
  final bool isDone;
  final int period;
  final String text;

  const DisplayTextWidget({
    Key? key,
    required this.textFieldController,
    this.onKebabTapped,
    required this.routineId,
    required this.isDone,
    required this.period,
    required this.text,
  }) : super(key: key);

  @override
  State<DisplayTextWidget> createState() => _DisplayTextWidgetState();
}

class _DisplayTextWidgetState extends State<DisplayTextWidget> {
  late FarmclubEtcController _farmclubController;
  late HomeBottomSheetController _homebottomSheetController =
      HomeBottomSheetController();
  MissionRoutineController controller = Get.find();

  void _navigateToAnotherPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CycleSetting(
              routineId: widget.routineId,
              period: widget.period,
              text: widget.text)),
    );
  }

  @override
  void initState() {
    super.initState();
    _farmclubController = FarmclubEtcController();
    _homebottomSheetController = HomeBottomSheetController();
    _farmclubController.isCheck.value = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: ListTile(
            title: Row(
              children: [
                if (widget.textFieldController.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      if (_farmclubController.isCheck.value == false) {
                        controller.checkRoutine(widget.routineId);
                        _farmclubController.toggleSelectCheck();
                      }
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
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            trailing: widget.textFieldController.text.isNotEmpty
                ? InkWell(
                    onTap: widget.onKebabTapped ??
                        () {
                          print("Default Kebab Tapped!");
                          _homebottomSheetController
                              .showCustomCupertinoActionSheet(
                            context,
                            options: ["주기 설정하기", "삭제하기"],
                            cancelButtonText: "취소",
                            optionsAction: [
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CycleSetting(
                                          routineId: widget.routineId,
                                          period: widget.period,
                                          text: widget.text)),
                                );
                              },
                              () {
                                // "삭제하기" 옵션은 여기에 구현하기
                              },
                            ],
                          );
                        },
                    child: const Icon(Icons.more_vert,
                        size: 22, color: FarmusThemeData.dark),
                  )
                : const SizedBox(), // Hidden if there is no text
          ),
        ));
  }
}
