import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/around/vegetable_list.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_make_content.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_make_edit.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_make_member.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_select.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_register_controller.dart';

import '../../model/veggie_registration.dart';

class FarmclubRegisterScreen extends StatefulWidget {
  const FarmclubRegisterScreen({super.key});

  @override
  State<FarmclubRegisterScreen> createState() => _FarmclubRegisterScreenState();
}

class _FarmclubRegisterScreenState extends State<FarmclubRegisterScreen> {
  FarmclubRegisterController _controller =
      Get.put(FarmclubRegisterController());

  @override
  void initState() {
    super.initState();
    _controller.getAllVeggie();
    _controller.getVeggieRegistration();
    _controller.isSelectedVeggie.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "팜클럽 개설"),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            color: FarmusThemeData.brown,
          ));
        } else {
          return SingleChildScrollView(
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
                  NewVegetableSelect(
                    isFarmclub: true,
                    allVegeInforList: _controller.allVeggie.value,
                  ),
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
                  FarmclubMakeEdit(
                    hintText: "클럽명 예시",
                  ),
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
                  FarmclubMakeMember(
                    hintText: "",
                  ),
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
                    ),
                    child: FarmclubMakeContent(
                      hintText: "",
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          );
        }
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Column(
        children: [
          Expanded(
              child: SizedBox(
            height: 0,
          )),
          Divider(
            color: FarmusThemeData.grey4,
          ),
          ButtonBrown(
            text: "개설하기",
            enabled: _controller.isFormValid,
            onPress: () {
              _controller.postNewFarmclub();
            },
          ),
        ],
      ),
    );
  }
}
