import 'package:flutter/material.dart';

class CommunityCategory extends StatelessWidget {
  final String category;

  const CommunityCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(child: Text(category)),
      ),
    );
  }
}
