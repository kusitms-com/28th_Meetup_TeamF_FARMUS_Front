import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_text_info.dart';

class RecommendFarmclub extends StatefulWidget {
  final String farmclubImage;
  final String vegetable;
  final String farmclubTitle;
  final String level;

  final String nowPerson;
  final String maxPerson;
  final String dday;

  RecommendFarmclub({
    Key? key,
    required this.vegetable,
    required this.farmclubImage,
    required this.farmclubTitle,
    required this.level,
    required this.nowPerson,
    required this.maxPerson,
    required this.dday,
  }) : super(key: key);

  @override
  State<RecommendFarmclub> createState() => _RecommendFarmclubState();
}

class _RecommendFarmclubState extends State<RecommendFarmclub> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                  color: FarmusThemeData.background,
                  borderRadius: BorderRadius.circular(8.65),
                ),
                child: Image.asset(
                  widget.farmclubImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: FarmusThemeData.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    widget.vegetable,
                    style: TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 13,
                      fontFamily: "Pretendard",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          FarmclubTextInfo(
            vegetable: widget.vegetable,
            farmclubTitle: widget.farmclubTitle,
            level: widget.level,
            nowPerson: widget.nowPerson,
            maxPerson: widget.maxPerson,
            dday: widget.dday,
            isRecommend: true,
          )
        ],
      ),
    );
  }
}
