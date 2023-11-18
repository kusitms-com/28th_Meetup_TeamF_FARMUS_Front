import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_screen.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 16),
          child: SizedBox(
            height: 36,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '미션/루틴',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MissionRoutineScreen()),
                    );
                  },
                  child: SizedBox(
                    child: SvgPicture.asset(
                      "assets/image/ic_calendar.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 8),
              Divider(
                color: FarmusThemeData.grey2,
                height: 1,
                thickness: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
