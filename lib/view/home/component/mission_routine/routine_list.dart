import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/calendar_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/combined_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/display_text_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_controller.dart';

class RoutineListItem extends StatefulWidget {
  final int veggieId;
  final String veggieNickname;
  final String color;
  final VoidCallback resetFunciton;

  const RoutineListItem({
    Key? key,
    required this.veggieId,
    required this.veggieNickname,
    required this.color,
    required this.resetFunciton,
  }) : super(key: key);

  @override
  State<RoutineListItem> createState() => _RoutineListItemState();
}

class _RoutineListItemState extends State<RoutineListItem> {
  final CalendarController calendarController = Get.find();
  final MissionRoutineController controller = Get.find();
  bool isCombinedWidgetVisible = false;
  List<DisplayTextWidget> displayTextWidgets = [];

  void _handleTextSubmission(String text) {
    setState(() {
      isCombinedWidgetVisible = false;
    });
  }

  double calculateVeggieTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    const mathplusWidth = 22.0;
    const additionalPadding = 50.0;
    final veggieWidth = calculateVeggieTextWidth(
      widget.veggieNickname,
      const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.bold,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            print("Container tapped");
            setState(() {
              isCombinedWidgetVisible = !isCombinedWidgetVisible;
            });
          },
          child: Container(
            width: veggieWidth + mathplusWidth + additionalPadding,
            margin: const EdgeInsets.only(top: 12.0, left: 20.0, right: 20),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    // #XXXXXX -> 0xffXXXXXX
                    color: Color(int.parse('0xff' + widget.color.substring(1))),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.veggieNickname,
                            ),
                            const TextSpan(
                              text: '   ',
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/image/ic_math-plus.svg',
                        color: Colors.black,
                        width: mathplusWidth,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isCombinedWidgetVisible)
          CombinedWidget(
            textFieldController: TextEditingController(),
            onTextSubmitted: (text) {
              controller
                  .createRoutine(widget.veggieId, text,
                      calendarController.currentDate.value)
                  .then((value) => widget.resetFunciton());
              //루틴 새로 입력하면
              setState(() {
                // TODO 루틴 추가 api
                isCombinedWidgetVisible = false;
              });
            },
          ),
        for (var displayTextWidget in displayTextWidgets) displayTextWidget,
      ],
    );
  }
}
