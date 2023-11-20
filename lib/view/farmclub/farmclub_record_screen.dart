import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class FarmclubRecordScreen extends StatefulWidget {
  FarmclubRecordScreen({super.key});

  @override
  State<FarmclubRecordScreen> createState() => _FarmclubRecordScreenState();
}

class _FarmclubRecordScreenState extends State<FarmclubRecordScreen> {
  final FarmclubController controller = Get.put(FarmclubController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "함께 기록해요",
      ),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecordProfile(nickname: "파머", postTime: "10/29 4:12"),
            SizedBox(
              height: 12,
            ),
            RecordPicture(
              like: controller.like,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                style: FarmusThemeData.darkStyle14,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RecordProfile(nickname: "파머", postTime: "10/29 4:12"),
            SizedBox(
              height: 12,
            ),
            RecordPicture(
              like: controller.like,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                style: FarmusThemeData.darkStyle14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
