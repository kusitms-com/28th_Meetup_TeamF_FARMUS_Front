import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FarmClubListItem extends StatelessWidget {
  final String nickName;
  final String stepNum;
  final String mission;

  final VoidCallback onTap;

  const FarmClubListItem({
    Key? key,
    required this.nickName,
    required this.stepNum,
    required this.mission,
    required this.onTap,
  }) : super(key: key);

  double calculateContainerWidth(String text, BuildContext context) {
    final textLength = text.length;
    final screenWidth = MediaQuery.of(context).size.width;

    final minContainerWidth = screenWidth * 0.7;
    final maxContainerWidth = screenWidth * 0.9;

    return min(max(minContainerWidth, textLength * 10.0), maxContainerWidth);
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth =
        calculateContainerWidth(nickName + mission + stepNum, context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffDCFFD4),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 20.0),
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
                        fontFamily: 'Pretendard',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: nickName,
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
                          text: '$stepNum  ',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold, // Add this line
                          ),
                        ),
                        TextSpan(
                          text: mission,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/image/ic_arrow_right.svg',
                    color: Colors.black,
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
