import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/explore/green_button.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_text_info.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_detail_screen.dart';

class Farmclub extends StatefulWidget {
  final int id;
  final String title;
  final String vaggie;
  final String? image;
  final String level;
  final int maxUser;
  final int currentUser;
  final String status;

  const Farmclub(
      {super.key,
      required this.id,
      required this.title,
      required this.vaggie,
      required this.currentUser,
      this.image,
      required this.level,
      required this.maxUser,
      required this.status});

  @override
  State<Farmclub> createState() => _FarmclubState();
}

class _FarmclubState extends State<Farmclub> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FarmclubDetailScreen(
                  id: widget.id,
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
                  color: FarmusThemeData.grey4,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.image != null
                      ? Image.network(
                          widget.image!,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else if (loadingProgress.cumulativeBytesLoaded ==
                                loadingProgress.expectedTotalBytes) {
                              // 이미지가 완전히 로드된 경우
                              return child;
                            } else {
                              // 이미지 로딩 중
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    FarmusThemeData.brownButton,
                                  ),
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            }
                          },
                        )
                      : null,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              FarmclubTextInfo(
                vegetable: widget.vaggie,
                farmclubTitle: widget.title,
                level: widget.level,
                nowPerson: widget.currentUser,
                maxPerson: widget.maxUser,
                dday: widget.status,
                status: widget.status,
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
