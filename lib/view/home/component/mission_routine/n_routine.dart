import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class NRoutine extends StatelessWidget {
  final bool isChecked;
  final String routineName;
  final Function(bool?) onCheckboxChanged;
  final VoidCallback onOptionsIconPressed;

  NRoutine({
    required this.isChecked,
    required this.routineName,
    required this.onCheckboxChanged,
    required this.onOptionsIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: const TextStyle(
        color: FarmusThemeData.dark,
        fontSize: 16,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        isChecked
            ? "assets/image/ic_check_true.svg"
            : "assets/image/ic_check_false.svg",
      ),
      title: Text(routineName),
      trailing: InkWell(
        onTap: onOptionsIconPressed,
        child:
            const Icon(Icons.more_vert, size: 22, color: FarmusThemeData.dark),
      ),
    );
  }
}
