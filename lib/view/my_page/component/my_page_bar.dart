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
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBackButtonPressed ?? () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                'assets/image/ic_arrow_left.svg',
                height: 24.0,
                width: 24.0,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Opacity(
              opacity: 0,
              child: Icon(Icons.arrow_back, size: 45.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
