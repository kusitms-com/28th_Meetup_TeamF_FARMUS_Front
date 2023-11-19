import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubAroundVegetable extends StatelessWidget {
  final String vegetableImage;
  final String vegetable;

  const FarmclubAroundVegetable({
    super.key,
    required this.vegetableImage,
    required this.vegetable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.65),
              child: Image.network(vegetableImage),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "재배 채소",
                style: FarmusThemeData.grey2Style13,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                vegetable,
                style: FarmusThemeData.darkStyle18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
