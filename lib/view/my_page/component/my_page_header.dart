import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_profile.dart';

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
    void _navigateToMyProfilePage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MyProfilePage(),
        ),
      );
    }

    return Container(
      color: FarmusThemeData.green1,
      padding: const EdgeInsets.fromLTRB(16, 25, 0, 0),
      child: SafeArea(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: _navigateToMyProfilePage,
                        child: Row(
                          children: [
                            Text(
                              '$name 님',
                              style: const TextStyle(
                                color: FarmusThemeData.dark,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(
                              "assets/image/arrow_right_mypage.svg",
                            ),
                          ],
                        ),
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
