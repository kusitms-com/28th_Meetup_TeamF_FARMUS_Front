import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '미션/루틴',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Divider(
                color: FarmusThemeData.grey2,
                height: 1,
                thickness: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}
