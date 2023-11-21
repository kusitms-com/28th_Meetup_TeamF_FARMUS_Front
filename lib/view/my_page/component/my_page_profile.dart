import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/my_page_profile_controller.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String inputText = '';
  MyPageProfileController controller = Get.put(MyPageProfileController());
  BottomSheetController bottomSheetController = BottomSheetController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.textEditingController.text = controller.contentValue.value;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      appBar: PrimaryAppBar(
        title: "프로필 수정",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    bottomSheetController.showCustomCupertinoActionSheet(
                      context,
                      message: "프로필 사진",
                      options: ["앨범에서 사진 선택", "기본 이미지로 변경"],
                      optionsAction: [
                        () {
                          controller.pickImage();
                        },
                        () {
                          setState(() {
                            controller.profileImagePath.value = "null";
                          });
                          print("기본 이미지로 변경");
                        },
                      ],
                      cancelButtonText: "취소",
                    );
                  },
                  child: Obx(
                    () {
                      // SVG 이미지인 경우
                      if (controller.profileImagePath == "null") {
                        return CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: SvgPicture.asset(
                              'assets/image/ic_profile.svg',
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (controller.profileImagePath.value
                          .startsWith('http')) {
                        return CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.network(
                              controller.profileImagePath.value,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        // 일반 이미지인 경우
                        return CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.file(
                              File(controller.profileImagePath.value),
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("닉네임", style: FarmusThemeData.darkStyle13),
              ),
              const SizedBox(height: 10),
              Obx(
                () => TextFormField(
                  controller: controller.textEditingController,
                  maxLength: 10,
                  style: FarmusThemeData.darkStyle13,
                  cursorColor: FarmusThemeData.dark,
                  decoration: InputDecoration(
                    hintText: "이름을 입력해주세요",
                    hintStyle: FarmusThemeData.grey3Style13,
                    errorText: controller.hasSpecialCharacters.value
                        ? '특수문자는 입력할 수 없어요'
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: FarmusThemeData.grey4,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: FarmusThemeData.grey4,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: FarmusThemeData.grey4,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: FarmusThemeData.grey4,
                      ),
                    ),
                    errorStyle: const TextStyle(
                      color: FarmusThemeData.red,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Column(
        children: [
          const Expanded(
            child: SizedBox(
              height: 0,
            ),
          ),
          const Divider(
            color: FarmusThemeData.grey4,
          ),
          ButtonBrown(
            text: "확인",
            enabled: controller.hasInput,
            onPress: () {
              controller.postProfile();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
