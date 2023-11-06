import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;

  const MyPageAppBar({
    Key? key,
    required this.title,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBackButtonPressed ?? () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                'assets/image/ic_arrow_left.svg', // Replace with your asset path
                height: 24.0,
                width: 24.0,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              // Use Expanded to center the title in the remaining space
              child: Text(
                title,
                textAlign: TextAlign.center, // Center the text horizontally
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Opacity(
              opacity: 0,
              child: Icon(Icons.arrow_back, size: 45.0),
            ), //화살표 때문에 밀려난 공간 고려해서 가운데 정렬
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
