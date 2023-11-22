import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/model/farmus_user.dart';
import 'package:mojacknong_android/repository/mypage_repository.dart';
import 'package:mojacknong_android/repository/onboarding_repository.dart';

class MyPageProfileController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  RxBool hasInput = RxBool(false);
  RxBool hasSpecialCharacters = RxBool(false);
  RxString profileImagePath = "assets/image/ic_profile.svg".obs;
  Rx<FarmusUser?> user = Rx<FarmusUser?>(null);

  final ImagePicker _picker = ImagePicker();
  final contentValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    updateTextfield();
  }

  void updateTextfield() {
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        hasInput.value = true;
        print(value);
      } else {
        hasInput.value = false;
      }

      // 특수문자를 입력했는지
      if (value.contains(RegExp(r'[!@#<>?":.,_`~;/[\]\\|=+)(*&^%$]'))) {
        hasSpecialCharacters.value = true;
      } else if (value.contains(RegExp(r"['-]"))) {
        hasSpecialCharacters.value = true;
      } else {
        hasSpecialCharacters.value = false;
      }
    });
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);

      print("Selected Image Path: ${selectedImage.path}");

      // 갤러리에서 선택한 파일을 사용하여 프로필 이미지 업데이트
      updateProfileImage(selectedImage.path);
    }
  }

  // 프로필 이미지 업데이트
  void updateProfileImage(String imagePath) {
    profileImagePath.value = imagePath;
  }

  Future<void> getUser() async {
    try {
      FarmusUser? response = await MypageRepository.getUserApi();
      user.value = response;

      profileImagePath.value = user.value!.userImageUrl;
      contentValue.value = user.value!.nickName!;

      print(profileImagePath);
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching user data: $error');
      throw error;
    }
  }

  Future<void> postProfile() {
    if (profileImagePath != "null") {
      if (!profileImagePath!.startsWith('http')) {
        print("프로필 보내기 !!!! $profileImagePath");

        return OnboardingRepository.postProfileApi(
            File(profileImagePath.value), contentValue.value);
      } else {
        print("갤러리에서 사진을 선택하지 않았습니다.");
        return OnboardingRepository.postProfileApi(null, contentValue.value);
      }
    } else {
      OnboardingRepository.postProfileApi(null, contentValue.value);
      return patchUserProfile();
    }
  }

  Future<void> patchUserProfile() async {
    try {
      OnboardingRepository.patchUserProfileDelete();
      print("프로필 기본 이미지로 변경");
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching user data: $error');
      throw error;
    }
  }
}
