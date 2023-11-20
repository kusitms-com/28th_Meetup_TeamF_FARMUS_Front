import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';

import '../../repository/mypage_repository.dart';
import '../community/component/community_picture.dart';

class MyFarmclubMissionScreen extends StatefulWidget {
  final String? detailId;

  const MyFarmclubMissionScreen({
    super.key,
    required this.detailId


  });

  @override
  State<MyFarmclubMissionScreen> createState() =>
      _MyFarmclubMissionScreenState();
}

class _MyFarmclubMissionScreenState extends State<MyFarmclubMissionScreen> {
  final FarmclubEtcController farmclubController = Get.put(FarmclubEtcController());
  late String detailId;


  @override
  void initState() {
    super.initState();
    detailId = widget.detailId!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 미션",
      ),
      backgroundColor: FarmusThemeData.white,
      body: FutureBuilder(
        future: MypageRepository.farmClubHistoryApi(detailId),
        builder: ( context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
        print("화면 로딩 중");
        return CircularProgressIndicator();
        } else if (snapshot.hasError) {
        // 에러가 발생한 경우
        return Text('Error: ${snapshot.error}');
        } else {

          return ListView.builder(
            itemCount: snapshot.data?.farmClubHistoryList.length, // 아이템 개수
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      ChallengeStep(
                        step: snapshot.data?.farmClubHistoryList[index].stepNum,
                        title: snapshot.data?.farmClubHistoryList[index].stepName,
                      ),
                      Spacer(),
                      Text(
                        "${snapshot.data!.farmClubHistoryList[index].dateTime}",
                        style: FarmusThemeData.grey2Style13,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CommunityPicture(image: snapshot.data?.farmClubHistoryList[index].postImage),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${snapshot.data?.farmClubHistoryList[index].content}",
                          style: FarmusThemeData.darkStyle14,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              );
            },
          );

        }


        },


      )
    );
  }
}












// Row(
//   children: [
//     ChallengeStep(
//       step: "1",
//       title: "상훈이 씨앗 심고 사진 찍기",
//     ),
//     Spacer(),
//     Text(
//       "10/29 4:12",
//       style: FarmusThemeData.grey2Style13,
//     ),
//     SizedBox(
//       width: 16,
//     ),
//   ],
// ),
// SizedBox(
//   height: 16,
// ),
// RecordPicture(
//   like: 1.obs,
// ),
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Text(
//     "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
//     style: FarmusThemeData.darkStyle14,
//   ),
// ),
// SizedBox(
//   height: 16,
// ),
// Row(
//   children: [
//     ChallengeStep(
//       step: "2",
//       title: "상훈이 씨앗 심고 사진 찍기",
//     ),
//     Spacer(),
//     Text(
//       "10/29 4:12",
//       style: FarmusThemeData.grey2Style13,
//     ),
//     SizedBox(
//       width: 16,
//     ),
//   ],
// ),
// SizedBox(
//   height: 16,
// ),
// RecordPicture(
//   like: 1.obs,
// ),
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Text(
//     "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
//     style: FarmusThemeData.darkStyle14,
//   ),
// ),
// SizedBox(
//   height: 16,
// ),