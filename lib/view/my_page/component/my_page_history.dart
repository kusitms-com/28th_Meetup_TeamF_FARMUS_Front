import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

// 새로운 페이지를 위한 스텁(더미) 위젯
class MyPageList extends StatelessWidget {
  final String? data; // 데이터 전달 예제

  const MyPageList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data!), // AppBar에 데이터를 제목으로 사용
      ),
      body: Center(
        child: Text('New page with data: $data'),
      ),
    );
  }
}

class MyPageHistory extends StatefulWidget {
  final String? name;
  final String? veggieName;
  final String? period;
  final String? image;

  const MyPageHistory({
    Key? key,
    required this.name,
    required this.veggieName,
    required this.period,
    required this.image
  }) : super(key: key);

  @override
  State<MyPageHistory> createState() => _MyPageHistoryState();
}

class _MyPageHistoryState extends State<MyPageHistory> {


  void _navigateToNewPage(BuildContext context) {
    // `MaterialPageRoute`를 사용하여 새 페이지로 이동
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyPageList(data: widget.name), // 여기서 필요한 데이터를 전달
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          _navigateToNewPage(context), // 탭할 때 `_navigateToNewPage` 메서드 호출
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      widget.image ?? ''
                      ), // 이미지 URL
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
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: widget.veggieName,
                          style: const TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    widget.period!,
                    style: const TextStyle(
                        color: FarmusThemeData.brownText // 색상 설정
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
