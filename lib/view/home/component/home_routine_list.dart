import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/detail/checkboxitem.dart';

class HomeRoutineList extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChecked;
  final VoidCallback onKebabTapped;

  const HomeRoutineList({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChecked,
    required this.onKebabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListItem(
      text: text,
      isChecked: isChecked,
      onChecked: onChecked,
      onKebabTapped: onKebabTapped,
    );
  }
}
