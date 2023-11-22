import 'dart:io';

import 'package:get/get.dart';

import '../../../../repository/diary_repository.dart';

class DiaryPostController extends GetxController {
  // 제목, 내용 작성
  // final titleValue = "".obs;
  final contentValue = "".obs;
  final image = Rxn<File>();
  final isBool = RxBool(false);

  // var selectedCategory = "".obs;

  // void selectCategory(String category) {
  //   selectedCategory.value = category;
  // }

  // void updateTitleValue(String value) {
  //   titleValue.value = value;
  // }

  final imageBool = RxBool(false);
 // final contentBool = RxBool(false);


  void updateImageBoolValue(bool value){
    imageBool.value = value;
    print(imageBool.value);
  }

  // void updateContentBoolValue(bool value){
  //   contentBool.value = value;
  //   print(contentBool.value);
  // }

  bool diaryWriteException(){

    return imageBool.value;

  }


  void updateSwitchValue(bool value){
    isBool.value = value;
    print(isBool.value);
  }

  void updateContentValue(String value) {
    contentValue.value = value;
    print(contentValue.value);
  }

  void setImageFile(File file) {

    image.value = file;
    print(image.value);
  }


  Future<void> writeDiaryRequest(int vegeId) async {

    await DiaryRepository.writeDiaryApi(
      vegeId,
      contentValue.value,
      isBool.value,
      image.value!

    );
  }
}
