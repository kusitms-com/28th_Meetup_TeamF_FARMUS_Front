import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view_model/controllers/my_page_profile_controller.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String inputText = '';
  MyPageProfileController controller = Get.put(MyPageProfileController());

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
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300],
                  child: SvgPicture.asset(
                    'assets/image/ic_profile.svg',
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                " 닉네임",
                style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
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
          Expanded(
              child: SizedBox(
            height: 0,
          )),
          Divider(
            color: FarmusThemeData.grey4,
          ),
          ButtonBrown(
            text: "확인",
            enabled: controller.hasInput,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
