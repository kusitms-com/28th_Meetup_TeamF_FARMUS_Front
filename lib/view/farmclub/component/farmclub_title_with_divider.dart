import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubTitleWithDivider extends StatelessWidget {
  final String title;
  const FarmclubTitleWithDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FarmusThemeData.darkStyle17,
            ),
            SizedBox(
              height: 4,
            ),
            Divider(
              color: FarmusThemeData.grey3,
            )
          ],
        ),
      ),
    );
  }
}
