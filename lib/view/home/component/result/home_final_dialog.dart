import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeFinalDialog extends StatefulWidget {
  const HomeFinalDialog({super.key});

  @override
  State<HomeFinalDialog> createState() => _HomeFinalDialogState();
}

class _HomeFinalDialogState extends State<HomeFinalDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AlertDialog(
        backgroundColor: FarmusThemeData.white,
        actions: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/image/ic_join_check.svg",
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "홈파밍을 종료합니다.",
                        style: FarmusThemeData.darkStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
