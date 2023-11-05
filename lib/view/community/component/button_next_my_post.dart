import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/my_post/my_post_screen.dart';

class ButtonNextMyPost extends StatelessWidget {
  const ButtonNextMyPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPostScreen(),
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '나의 글',
              style: TextStyle(color: FarmusThemeData.primary),
            ),
            const SizedBox(
              width: 5,
            ),
            // <-- Icon
            SvgPicture.asset(
              "assets/image/ic_arrow_right.svg",
              color: FarmusThemeData.primary,
            ),
          ],
        ),
      ),
    );
  }
}
