import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_join_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_register_controller.dart';

import '../../../../model/veggie_registration.dart';

class VegetableList extends StatefulWidget {
  final bool isMake;

  const VegetableList({Key? key, required this.isMake});

  @override
  State<VegetableList> createState() => _VegetableListState();
}

class _VegetableListState extends State<VegetableList> {
  final FarmclubRegisterController _makeController =
  Get.put(FarmclubRegisterController());
  final FarmclubJoinController _joinController =
  Get.put(FarmclubJoinController());

  @override
  Widget build(BuildContext context) {
    RxList<VeggieRegistration> veggieList = widget.isMake
        ? _makeController.veggieRegistration
        : _joinController.veggieRegistration;

    print("채소 데이터 ${veggieList.length}");

    return _joinController.veggieRegistration.isNotEmpty
        ? Container(
      width: double.infinity,
      height: 150,
      child: ListView.builder(
        itemCount: veggieList.length,
        itemBuilder: (context, index) {
          VeggieRegistration veggie = veggieList[index];
          return Obx(() {
            bool isSelected = widget.isMake
                ? _makeController.isCheck.value
                : _joinController.veggieSelected[index] == 1;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.isMake) {
                        _makeController.toggleSelectCheck();
                      } else {
                        _joinController.toggleSelectCheck(index);
                      }
                    },
                    child: SvgPicture.asset(
                      isSelected
                          ? "assets/image/ic_check_true.svg"
                          : "assets/image/ic_check_false.svg",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  widget.isMake
                      ? Text(
                      "[${veggie.veggieName}] ${veggie.veggieNickname}")
                      : Text("${veggie.veggieNickname}"),
                ],
              ),
            );
          });
        },
      ),
    )
        : Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "내 텃밭에 아직 팜클럽 채소를 심지 않았어요",
          style: FarmusThemeData.darkStyle16,
        ),
      ],
    );
  }
}
