import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class BottomSheetDiary extends StatefulWidget {
  final String? date;
  final String? image;
  final String? content;

  const BottomSheetDiary({
    super.key,
    required this.date,
    required this.image,
    required this.content,

  });

  @override
  State<BottomSheetDiary> createState() => _BottomSheetDiaryState();
}

class _BottomSheetDiaryState extends State<BottomSheetDiary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: FarmusThemeData.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        // 스크롤 가능한 내용을 위해 SingleChildScrollView 사용
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 32,
                left: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // '삭제' 버튼
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "삭제",
                      style: TextStyle(
                        color: FarmusThemeData.dark,
                        fontFamily: "Pretendard",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              widget.image!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: FarmusThemeData.grey4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    // 텍스트들을 세로로 배치
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.date!,
                        style: const TextStyle(
                          color: FarmusThemeData.brownText,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 8), // 텍스트 사이 간격
                      Text(
                        widget.content!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        maxLines: null, // 무제한 줄 수
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
