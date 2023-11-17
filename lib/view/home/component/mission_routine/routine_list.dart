import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/combined_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/display_text_widget.dart';

class RoutineListItem extends StatefulWidget {
  final String veggieNickname;
  final VoidCallback onTap;

  const RoutineListItem({
    Key? key,
    required this.veggieNickname,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RoutineListItem> createState() => _RoutineListItemState();
}

class _RoutineListItemState extends State<RoutineListItem> {
  bool isCombinedWidgetVisible = false;
  List<DisplayTextWidget> displayTextWidgets = [];

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
            widget.onTap();
          },
          child: Container(
            width: veggieWidth + mathplusWidth + additionalPadding,
            margin: const EdgeInsets.only(left: 20.0, right: 20, bottom: 12),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffDCccD4),
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
              setState(() {
                displayTextWidgets.add(
                  DisplayTextWidget(
                    textFieldController: TextEditingController(text: text),
                    text: text,
                  ),
                );
              });
            },
          ),
        for (var displayTextWidget in displayTextWidgets) displayTextWidget,
        const SizedBox(height: 12),
      ],
    );
  }
}
