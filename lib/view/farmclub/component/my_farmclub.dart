import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

import '../../../view_model/controllers/farmclub/farmclub_controller.dart';

class MyFarmclub extends StatefulWidget {
  final String myFarmclubImage;
  final VoidCallback onSelect;
  final bool isSelected;
  final int id;

  MyFarmclub({
    Key? key,
    required this.myFarmclubImage,
    required this.onSelect,
    required this.isSelected,
    required this.id,
  }) : super(key: key);

  @override
  State<MyFarmclub> createState() => _MyFarmclubState();
}

class _MyFarmclubState extends State<MyFarmclub> {
  FarmclubController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {
        // 선택 시 FarmclubController의 updateSelectedFarmclub 메서드 호출
        _controller.updateSelectedFarmclub(widget.id);
        widget.onSelect();
      },
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: widget.myFarmclubImage.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.isSelected
                          ? widget.myFarmclubImage
                          : widget.myFarmclubImage,
                      // 여기에서 이미지를 선택하거나 그레이 이미지로 선택하도록 수정
                      fit: BoxFit.fill,
                      color: widget.isSelected ? null : Colors.grey,
                      colorBlendMode: BlendMode.saturation,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
