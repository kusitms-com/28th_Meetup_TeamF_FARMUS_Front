import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/farmclub/component/recommned_farmclub.dart';

class RecommendFarmclubList extends StatefulWidget {
  @override
  State<RecommendFarmclubList> createState() => _RecommendFarmclubListState();
}

class _RecommendFarmclubListState extends State<RecommendFarmclubList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            RecommendFarmclub(),
            RecommendFarmclub(),
            RecommendFarmclub(),
            RecommendFarmclub(),
            RecommendFarmclub(),
            RecommendFarmclub(),
            RecommendFarmclub(),
          ],
        ),
      ),
    );
  }
}
