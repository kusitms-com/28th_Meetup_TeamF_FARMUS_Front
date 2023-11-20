import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_join_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_make_controller.dart';

class VegetableList extends StatefulWidget {
  final bool isMake;

  const VegetableList({Key? key, required this.isMake});

  @override
  State<VegetableList> createState() => _VegetableListState();
}

class _VegetableListState extends State<VegetableList> {
  final FarmclubMakeController _makeController = Get.put(FarmclubMakeController());
  final FarmclubJoinController _joinController = Get.put(FarmclubJoinController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: widget.isMake
          ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _makeController.toggleSelectCheck();
                  },
                  child: Obx(() {
                    return SvgPicture.asset(
                      _makeController.isCheck.value
                          ? "assets/image/ic_check_true.svg"
                          : "assets/image/ic_check_false.svg",
                    );
                  }),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("[상추] 상훈이"),
              ],
            )
          : Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _joinController.toggleSelectCheck();
                  },
                  child: Obx(() {
                    return SvgPicture.asset(
                      _joinController.isCheck.value
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
