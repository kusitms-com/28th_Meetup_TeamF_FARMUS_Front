import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyPageHeader extends StatelessWidget {
  final String name;
  final String date;
  //final String imagePath;

  const MyPageHeader({
    Key? key,
    required this.name,
    required this.date,
    //required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FarmusThemeData.green1,
      padding: const EdgeInsets.fromLTRB(16, 25, 0, 0),
      child: SafeArea(
        // To keep the content within the safe area of the phone
        child: Row(
          children: <Widget>[
            ClipOval(
              child: SvgPicture.asset(
                'assets/image/profile_example_mypage.svg',
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize
                        .min, // Use min to contain the size to fit the content
                    children: [
                      Text(
                        '$name 님', // The variable $name will be replaced with the actual name
                        style: const TextStyle(
                          color: FarmusThemeData
                              .dark, // Assuming FarmusThemeData.dark is defined somewhere in your theme
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        icon: SvgPicture.asset(
                          "assets/image/arrow_right_mypage.svg", // Path to your SVG icon
                        ),
                        padding: EdgeInsets.zero, // Remove padding
                        constraints:
                            const BoxConstraints(), // Tighten constraints
                      ),
                    ],
                  ),
                  Text(
                    '팜어스와 함께한 지 D+$date',
                    style: const TextStyle(
                      fontFamily: "Pretendard-Semi-Bold",
                      color: FarmusThemeData.primary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/image/logo_tree.svg",
                  width: 85,
                  height: 103,
                ),
                Positioned(
                  top: 1,
                  right: -5,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      // setting click 시 todo
                    },
                    icon: SvgPicture.asset(
                      "assets/image/settings_icon.svg",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
