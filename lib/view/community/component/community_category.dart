import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityCategory extends StatefulWidget {
  final String category;

  const CommunityCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CommunityCategory> createState() => _CommunityCategoryState();
}

class _CommunityCategoryState extends State<CommunityCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? FarmusThemeData.brown2
                : FarmusThemeData.background,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GestureDetector(
              child: Text(
                widget.category,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
