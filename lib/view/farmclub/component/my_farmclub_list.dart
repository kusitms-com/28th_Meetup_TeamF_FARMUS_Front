import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_mine.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class MyFarmclubList extends StatefulWidget {
  final List<FarmclubMine> farmclubData;

  MyFarmclubList({
    Key? key,
    required this.farmclubData,
  }) : super(key: key);

  @override
  State<MyFarmclubList> createState() => _MyFarmclubListState();
}
class _MyFarmclubListState extends State<MyFarmclubList> {
  FarmclubController _controller = Get.put(FarmclubController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 50,
        child: Obx(() {
          // Obx로 감싸서 selectedFarmclubIndex의 변화를 실시간으로 감지
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.farmclubData.length,
            itemBuilder: (context, index) {
              bool isSelected = _controller.selectedFarmclubIndex.value == index;
              return MyFarmclub(
                myFarmclubImage: isSelected
                    ? widget.farmclubData[index].image
                    : widget.farmclubData[index].grayImage,
                onSelect: () {
                  _controller.updateSelectedFarmclub(index);
                },
                isSelected: isSelected,
                id: widget.farmclubData[index].challengeId,
              );
            },
          );
        }),
      ),
    );
  }
}
