import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/around/vegetable_list.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_make_edit.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_select.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_make_controller.dart';

class FarmclubMakeScreen extends StatefulWidget {
  const FarmclubMakeScreen({super.key});

  @override
  State<FarmclubMakeScreen> createState() => _FarmclubMakeScreenState();
}

class _FarmclubMakeScreenState extends State<FarmclubMakeScreen> {
  FarmclubMakeController _controller = FarmclubMakeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "팜클럽 개설"),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "함께 재배할 채소를 선택해주세요",
              style: FarmusThemeData.darkStyle14,
            ),
            const SizedBox(
              height: 16,
            ),
            NewVegetableSelect(),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "어떤 채소로 팜클럽에 참여할 지 선택해주세요",
              style: FarmusThemeData.darkStyle14,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: FarmusThemeData.grey4)),
                child: Column(
                  children: [
                    VegetableList(
                      isMake: true,
                    ),
                  ],
                )),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "팜클럽의 이름을 입력해주세요",
              style: FarmusThemeData.darkStyle14,
            ),
            const SizedBox(
              height: 16,
            ),
            FarmclubMakeEdit(),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "참여 멤버 수를 입력해주세요 (최소 3명 최대 20명)",
              style: FarmusThemeData.darkStyle14,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: FarmusThemeData.grey4)),
                child: VegetableList(
                  isMake: true,
                )),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "팜클럽 한 줄 소개를 입력해주세요",
              style: FarmusThemeData.darkStyle14,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: FarmusThemeData.grey4)),
                child: VegetableList(
                  isMake: true,
                )),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      )),
    );
  }
}
