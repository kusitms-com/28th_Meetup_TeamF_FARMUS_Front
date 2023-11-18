import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/community_feed_controller.dart';
import 'package:mojacknong_android/view_model/controllers/community_post_controller.dart';

class CommunityCategory extends StatefulWidget {
  final String category;
  final CommunityFeedController? feedController;
  final CommunityPostController? postController;
  final bool? isSelected;
  final VoidCallback? onSelected;

  const CommunityCategory({
    Key? key,
    required this.category,
    this.feedController,
    this.postController,
    this.isSelected,
    this.onSelected,
  }) : super(key: key);

  @override
  State<CommunityCategory> createState() => _CommunityCategoryState();
}

class _CommunityCategoryState extends State<CommunityCategory> {
  late bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              if (widget.feedController != null) {
                widget.feedController!.selectCategory(""); // 선택 해제
              }
            } else {
              if (widget.feedController != null) {
                widget.feedController!.selectCategory(widget.category); // 선택
              }
            }
            isSelected = !isSelected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? FarmusThemeData.category
                  : FarmusThemeData.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: GestureDetector(
                child: Text(
                  widget.category,
                  style: TextStyle(
                    color: isSelected
                        ? FarmusThemeData.white
                        : FarmusThemeData.dark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
