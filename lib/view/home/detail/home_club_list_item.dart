import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FarmClubListItem extends StatelessWidget {
  final String veggieNickname;
  final String routineId;
  final String routineName;

  final VoidCallback onTap;

  const FarmClubListItem({
    Key? key,
    required this.veggieNickname,
    required this.routineId,
    required this.routineName,
    required this.onTap,
  }) : super(key: key);

  double calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    const arrowRightWidth = 22.0;
    final textWidth = calculateTextWidth(
      '$veggieNickname  |  Step $routineId  $routineName',
      const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.bold,
      ),
    );
    print("textWidth: $textWidth");
    print("textWidth: $textWidth + $arrowRightWidth + 20");
    return InkWell(
      onTap: onTap,
      child: Container(
        width: textWidth + arrowRightWidth + 50,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffDCFFD4),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 20.0, right: 20, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
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
                          text: veggieNickname,
                        ),
                        const TextSpan(
                          text: '  |  ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        const TextSpan(
                          text: 'Step ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: routineId,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: '   ',
                        ),
                        TextSpan(
                          text: routineName,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/image/ic_arrow_right.svg',
                    color: Colors.black,
                    width: arrowRightWidth,
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
