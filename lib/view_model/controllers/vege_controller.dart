import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/vege_repository.dart';

class VegeController extends GetxController {
  final selectedVeggieId = "".obs;
  final selectedVeggieColorImageUrl = "".obs;
  final vegename = "".obs;
  final nicknameValue = "".obs;
  final selectedDate = "".obs;



  bool vegeRegisterException(){


    print("닉네임 " +nicknameValue.value +"날짜 "+selectedDate.value +"채소 id "+selectedVeggieId.value);
    if(nicknameValue.value == "" || selectedDate.value == ""  || selectedVeggieId.value == ""){
      return false;
    }

    return true;

  }




  void updateSelectedDate(String date) {
    selectedDate.value = date;
    print(selectedDate.value);
  }

  // 선택한 채소의 id와 colorImageUrl을 업데이트하는 메서드
  void updateSelectedVeggieData(String id, String colorImageUrl, String vegeName) {
    selectedVeggieId.value = id;
    selectedVeggieColorImageUrl.value = colorImageUrl;
    vegename.value = vegeName;
    print(selectedVeggieId.value);
    print(selectedVeggieColorImageUrl.value);
    print(vegename.value);
  }

  void updateNicknameValue(String value) {
    nicknameValue.value = value;
    print(nicknameValue.value);
  }

  String selectNicknameValue(){

    return nicknameValue.value;

  }

  Future<void> enrollVegeRequest() async {

    await VegeRepository.enrollVegeApi(selectedDate.value, selectedVeggieId.value,
        selectedVeggieColorImageUrl.value, nicknameValue.value, vegename.value);
  }





  RxList<bool> isSelectedList = List.generate(6, (index) => false).obs;
  RxInt selectedVeggieIndex = RxInt(-1);
  RxBool isLoading = RxBool(false);


  RxBool isMemberValid = RxBool(true); // 추가
  final RegExp _numberRegExp = RegExp(r'^[3-9]$|^1[0-9]$|^20$'); // 추가

  RxBool isCheck = RxBool(false);

  RxMap veggieData = {}.obs;
  RxMap veggieLevel = {}.obs;

  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController memberController = TextEditingController();
  final TextEditingController introController = TextEditingController();


  final titleValue = "".obs;
  final memberValue = "".obs;
  final contentValue = "".obs;

  RxBool hasNameInput = RxBool(false);
  RxBool hasMemberInput = RxBool(false);
  RxBool hasIntroInput = RxBool(false);

  RxBool isFormValid = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    initHasText();

    ever(isCheck, (_) {
      checkFormVaildity();
    });

    ever(titleValue, (_) {
      checkFormVaildity();
    });

    ever(memberValue, (_) {
      checkFormVaildity();
    });

    ever(contentValue, (_) {
      checkFormVaildity();
    });

    ever(selectedVeggieIndex, (_) {
      checkFormVaildity();
    });


    // UI 초기화 로직 분리
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeVeggieData();
      initializeVeggieLevel();
      isLoading.value = true; // 초기화가 끝나면 로딩 상태 해제
    });


  }


  // 선택된 채소의 인덱스를 업데이트하는 메서드
  void updateSelectedVeggieIndex(int index) {
    selectedVeggieIndex.value = index;
  }

  void initHasText() {
    nameController.addListener(() {
      hasNameInput.value = nameController.text.isNotEmpty;
      update();
    });

    memberController.addListener(() {
      hasMemberInput.value = memberController.text.isNotEmpty;
      update();
    });

    introController.addListener(() {
      hasIntroInput.value = introController.text.isNotEmpty;
      update();
    });
  }



  void toggleImageSelection(int index) {
    if (isSelectedList[index]) {
      // 이미 선택된 아이템을 선택하면 선택 해제
      isSelectedList[index] = false;
      updateSelectedVeggieIndex(-1);
    } else {
      // 선택되지 않은 아이템을 선택하면 반전
      for (int i = 0; i < isSelectedList.length; i++) {
        isSelectedList[i] = i == index;
      }
      updateSelectedVeggieIndex(index);
    }

    update(); // 상태 업데이트
  }

  // 채소 데이터를 초기화하는 메서드
  void initializeVeggieData() {
    veggieData.addAll({
      'lettuce': '상추',
      'greenonion': '대파',
      'basil': '바질',
      'sesame': '깻잎',
      'pepper': '고추',
      'tomato': '토마토',
    });
  }

  // 난이도 데이터를 초기화하는 메서드
  void initializeVeggieLevel() {
    veggieLevel.addAll({
      'lettuce': 'Easy',
      'greenonion': 'Easy',
      'basil': 'Normal',
      'sesame': 'Normal',
      'pepper': 'Hard',
      'tomato': 'Hard',
    });
  }




  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
  }

  void updateTitleValue(String value) {
    titleValue.value = value;
  }

  void updateMemberValue(String value) {
    memberValue.value = value;
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void checkMemberValidity() {
    isMemberValid.value = _numberRegExp.hasMatch(memberValue.value);
  }

  void checkFormVaildity() {
    isFormValid.value = contentValue.isNotEmpty &&
        titleValue.isNotEmpty &&
        memberValue.isNotEmpty &&
        isCheck.value &&
        selectedVeggieIndex.value != -1;
  }
}
