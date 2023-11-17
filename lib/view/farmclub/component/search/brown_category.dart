import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class BrownCategory extends StatefulWidget {
  final String category;
  final bool? isSelected;

  const BrownCategory({
    Key? key,
    required this.category,
    this.isSelected,
  }) : super(key: key);

  @override
  State<BrownCategory> createState() => _BrownCategoryState();
}

class _BrownCategoryState extends State<BrownCategory> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {
        setState(() {
          isSelected = !isSelected;
          Get.find<FarmclubController>().toggleSelectCategory();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? FarmusThemeData.brown2 : FarmusThemeData.grey5,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GestureDetector(
              child: Text(
                widget.category,
                style: TextStyle(
                  color: FarmusThemeData.dark,
                  fontSize: 13,
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
