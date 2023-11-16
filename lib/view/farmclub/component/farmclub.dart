import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/explore/green_button.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_text_info.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_detail_screen.dart';

class Farmclub extends StatefulWidget {
  final String title;

  const Farmclub({
    super.key,
    required this.title,
  });

  @override
  State<Farmclub> createState() => _FarmclubState();
}

class _FarmclubState extends State<Farmclub> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FarmclubAroundScreen(
                  title: widget.title,
                );
              },
            ),
          );
        },
        child: Container(
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: FarmusThemeData.grey4),
              ),
              SizedBox(
                width: 8,
              ),
              FarmclubTextInfo(
                vegetable: "상추",
                farmclubTitle: widget.title,
                level: "Easy",
                nowPerson: "5",
                maxPerson: "8",
                dday: "1",
                isRecommend: false,
              ),
              Spacer(),
              GreenButton(
                title: widget.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
