import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_challenge_screen.dart';

class ChallengeTitle extends StatefulWidget {
  final String step;
  final String title;
  final String help;

  const ChallengeTitle({
    super.key,
    required this.step,
    required this.title,
    required this.help,
  });

  @override
  State<ChallengeTitle> createState() => _ChallengeTitleState();
}

class _ChallengeTitleState extends State<ChallengeTitle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FarmclubChallengeScreen();
            },
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Step ${widget.step}",
                style: FarmusThemeData.brownText14,
              ),
              SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                "assets/image/line_vertical_grey1.svg",
              ),
              SizedBox(
                width: 8,
              ),
              Text(widget.title),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: FarmusThemeData.brown3),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "도움말   ${widget.help}",
                    textAlign: TextAlign.start,
                    style: FarmusThemeData.brownText13,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
