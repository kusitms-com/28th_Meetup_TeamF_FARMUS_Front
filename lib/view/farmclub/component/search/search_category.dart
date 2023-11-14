import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/search/brown_category.dart';

class SearchCategory extends StatelessWidget {
  final String title;
  final List<String> categories;

  const SearchCategory(
      {Key? key, required this.title, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: FarmusThemeData.grey1,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 8),
        ...categories.map((category) => BrownCategory(category: category)),
      ],
    );
  }
}
