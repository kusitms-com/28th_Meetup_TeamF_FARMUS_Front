import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/component/my_challenge_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_history_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

import '../../repository/mypage_repository.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FarmusThemeData.white,
        body: FutureBuilder(
            future: MypageRepository.getUserApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("화면 로딩 중");
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // 에러가 발생한 경우
                return Text('Error: ${snapshot.error}');
              } else {
                // 데이터가 성공적으로 도착한 경우
                final data = snapshot.data;
                print(data);
                return Column(children: <Widget>[
                  MyPageHeader(
                      name: data?.nickName,
                      date: data?.dday,
                      imagePath: data?.userImageUrl), // 사용자 정의 헤더를 여기에 넣습니다.
                  const SizedBox(height: 12.0), // 필요한 공간을 추가합니다.

                  HistoryHeader(historyType: "채소 히스토리"),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 4.0),
                      children: const <Widget>[
                        MyPageHistory(
                          name: '상훈이',
                          nickname: '상추',
                          date: '2023.10.01~2023.11.22',
                        ),
                        MyPageHistory(
                          name: '먹쟁이토마토',
                          nickname: '방울토마토',
                          date: '2023.06.27~현재',
                        ),
                        MyPageHistory(
                          name: '깨르륵',
                          nickname: '깻잎',
                          date: '2023.05.03~현재',
                        ),
                        // 추가하려면 여기에 넣기
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const ChallengeHeader(historyType: "팜클럽 히스토리"),
                  const SizedBox(height: 12.0),
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.only(top: 4.0),
                    children: const <Widget>[
                      MyPageHistory(
                        name: '상추 좋아하세요',
                        nickname: '상추',
                        date: '2023.10.01~2023.11.22',
                      ),
                      MyPageHistory(
                        name: '남아프리카공화국',
                        nickname: '파프리카',
                        date: '2023.06.27~현재',
                      ),
                      MyPageHistory(
                        name: '깨르륵깨르륵',
                        nickname: '깻잎',
                        date: '2023.05.03~현재',
                      ),
                      // 추가하려면 여기에 넣기
                    ],
                  ))
                ]);
              }
            }));
  }
}

    //
    //   Column(
    //     children: <Widget>[
    //       const MyPageHeader(name: '파머', date: '100'), // 사용자 정의 헤더를 여기에 넣습니다.
    //       const SizedBox(height: 12.0), // 필요한 공간을 추가합니다.
    //
    //       const HistoryHeader(historyType: "채소 히스토리"),
    //       const SizedBox(height: 12.0),
    //       Expanded(
    //         child: ListView(
    //           padding: const EdgeInsets.only(top: 4.0),
    //           children: const <Widget>[
    //             MyPageHistory(
    //               name: '상훈이',
    //               nickname: '상추',
    //               date: '2023.10.01~2023.11.22',
    //             ),
    //             MyPageHistory(
    //               name: '먹쟁이토마토',
    //               nickname: '방울토마토',
    //               date: '2023.06.27~현재',
    //             ),
    //             MyPageHistory(
    //               name: '깨르륵',
    //               nickname: '깻잎',
    //               date: '2023.05.03~현재',
    //             ),
    //             // 추가하려면 여기에 넣기
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 10.0),
    //       const ChallengeHeader(historyType: "팜클럽 히스토리"),
    //       const SizedBox(height: 12.0),
    //       Expanded(
    //         child: ListView(
    //           padding: const EdgeInsets.only(top: 4.0),
    //           children: const <Widget>[
    //             MyPageHistory(
    //               name: '상추 좋아하세요',
    //               nickname: '상추',
    //               date: '2023.10.01~2023.11.22',
    //             ),
    //             MyPageHistory(
    //               name: '남아프리카공화국',
    //               nickname: '파프리카',
    //               date: '2023.06.27~현재',
    //             ),
    //             MyPageHistory(
    //               name: '깨르륵깨르륵',
    //               nickname: '깻잎',
    //               date: '2023.05.03~현재',
    //             ),
    //             // 추가하려면 여기에 넣기
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    //
    //
