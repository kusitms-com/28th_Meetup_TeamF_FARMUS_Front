import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class VegetableList extends StatefulWidget {
  const VegetableList({Key? key});

  @override
  State<VegetableList> createState() => _VegetableListState();
}

class _VegetableListState extends State<VegetableList> {
  final FarmclubController _farmclubController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _farmclubController.toggleSelectCheck();
            },
            child: Obx(() {
              return SvgPicture.asset(
                _farmclubController.isCheck.value
                    ? "assets/image/ic_check_true.svg"
                    : "assets/image/ic_check_false.svg",
              );
            }),
          ),
          SizedBox(
            width: 8,
          ),
          Text("상훈이"),
        ],
      ),
    );
  }
}
