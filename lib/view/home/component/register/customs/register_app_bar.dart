import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class RegiCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegiCustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Handle back button press if needed
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/image/ic_arrow_left.svg'),
        ),
        backgroundColor: FarmusThemeData.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start, // Adjusted alignment
          children: [
            SizedBox(width: 105), // Add some space to the left
            Text(
              '채소 등록',
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
