import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyPageHistory extends StatefulWidget {
  final String name;
  final String nickname;
  final String date;

  const MyPageHistory({
    Key? key,
    required this.name,
    required this.nickname,
    required this.date,
  }) : super(key: key);

  @override
  State<MyPageHistory> createState() => _MyPageHistory();
}

class _MyPageHistory extends State<MyPageHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 이미지를 추가해야함 지금은 임의의 네트워크 이미지를 사용
          // 실제 사용 시에는 `widget.imagePath`와 같은 변수를 사용
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image:
                    NetworkImage('https://via.placeholder.com/150'), // 이미지 URL
                fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
              ),
              borderRadius:
                  BorderRadius.circular(10), // 모서리 둥글기 설정, 0으로 설정하면 직각
            ),
          ),
          const SizedBox(width: 12.0), // 이미지와 텍스트 사이의 간격
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 6.0),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.name} | ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: widget.nickname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  widget.date,
                  style:
                      const TextStyle(color: FarmusThemeData.brownText // 색상 설정
                          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
