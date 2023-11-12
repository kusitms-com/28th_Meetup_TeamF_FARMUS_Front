import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/community_post_controller.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CommunityPostController postController =
      Get.put(CommunityPostController());

  @override
  void initState() {
    super.initState();

    // 초기에 모두 false로 설정
    postController.isSelected1.value = false;
    postController.isSelected2.value = false;
    postController.isSelected3.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildCategoryButton("도와주세요", postController.isSelected1),
        buildCategoryButton("자랑할래요", postController.isSelected2),
        buildCategoryButton("정보나눠요", postController.isSelected3),
      ],
    );
  }

  Widget buildCategoryButton(String categoryName, RxBool isSelected) {
    return Bouncing(
      onPress: () {
        setState(() {
          // 해당 카테고리 선택 메서드 호출
          if (categoryName == "도와주세요") {
            postController.selectCategory1();
          } else if (categoryName == "자랑할래요") {
            postController.selectCategory2();
          } else if (categoryName == "정보나눠요") {
            postController.selectCategory3();
          }

          // 나머지 카테고리의 선택 상태를 false로 설정
          postController.isSelected1.value = categoryName == "도와주세요";
          postController.isSelected2.value = categoryName == "자랑할래요";
          postController.isSelected3.value = categoryName == "정보나눠요";

          print(
              "${postController.isSelected1}, ${postController.isSelected2}, ${postController.isSelected3}");
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected.value
                ? FarmusThemeData.category
                : FarmusThemeData.background,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GestureDetector(
              child: Text(
                categoryName,
                style: TextStyle(
                  color: isSelected.value
                      ? FarmusThemeData.white
                      : FarmusThemeData.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
