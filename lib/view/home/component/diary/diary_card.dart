import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_bottom_sheet.dart';

class DiaryCard extends StatelessWidget {
  final String? date;
  final String? image;
  final String? content;

  const DiaryCard({
    Key? key,
    required this.date,
    required this.image,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardBarHeight = 150 + 27; // card_bar.svg의 높이
    const double cardHeight = 150; // 카드의 높이
    //  final DateTime date = DateFormat('yyyy/MM/dd').parse(inputDate);
    // final String displayDate = DateFormat('yyyy년 MM월 dd일').format(date);

    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // shape: bode
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return BottomSheetDiary(
            date: date!,
            image: image!,
            content: content!,
          );
        },
      );
    }

    return InkWell(
      onTap: () => _showBottomSheet(context), // 여기를 수정합니다.
      child: Padding(
        padding:
        const EdgeInsets.only(top: 16.0, bottom: 16, right: 16, left: 22),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 20,
              child: SvgPicture.asset(
                'assets/image/card_bar.svg',
                height: cardBarHeight,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22.0 + 16, right: 16),
              padding: const EdgeInsets.all(16),
              height: cardHeight,
              decoration: BoxDecoration(
                border: Border.all(color: FarmusThemeData.grey4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date!,
                    style: const TextStyle(
                        color: FarmusThemeData.brownText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8), // 날짜와 이미지를 구분

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            image!,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(width: 8), // 이미지와 텍스트를 구분

                        Expanded(
                          child: Text(
                            content!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}