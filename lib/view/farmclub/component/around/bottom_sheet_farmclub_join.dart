import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/around/vegetable_list.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class BottomSheetFarmclubJoin extends StatefulWidget {
  const BottomSheetFarmclubJoin({Key? key});

  @override
  State<BottomSheetFarmclubJoin> createState() =>
      _BottomSheetFarmclubJoinState();
}

class _BottomSheetFarmclubJoinState extends State<BottomSheetFarmclubJoin> {
  final FarmclubController _farmclubController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text("팜클럽 가입", style: FarmusThemeData.darkStyle18),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "팜클럽에서 함께 키울 나의 채소를 골라주세요",
            style: FarmusThemeData.darkStyle14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FarmusThemeData.grey4,
              ),
            ),
            child: Column(
              children: [
                VegetableList(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ButtonBrown(
            text: "가입하기",
            enabled: !_farmclubController.isCheck.value,
          ),
        ),
      ],
    );
  }
}
