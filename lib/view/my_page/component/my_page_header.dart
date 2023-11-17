import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_profile.dart';
import 'package:mojacknong_android/view/my_page/my_page_setting_screen.dart';

class MyPageHeader extends StatelessWidget {
  final String? name;
  final int? date;
  final String? imagePath;

  MyPageHeader({
    Key? key,
    required this.name,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

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
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              ClipOval(
                child: imagePath != null
                    ? Image.network(
                        imagePath!,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        'assets/image/profile_example_mypage.svg', // 기본 이미지 경로
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
                    "assets/image/mypage_logo.svg",
                    width: 85,
                    height: 103,
                  ),
                  Positioned(
                    top: 1,
                    right: -5,
                    child: Bouncing(
                      onPress: () {},
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyPageSettingScreen();
                              },
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/image/settings_icon.svg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  bool userProfileSign(String userImageUrl) {
    if (userImageUrl == null) {
      return true;
    }
    return false;
  }
}
