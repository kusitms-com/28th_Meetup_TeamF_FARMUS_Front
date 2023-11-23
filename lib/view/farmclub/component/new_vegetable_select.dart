import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_item.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_register_controller.dart';

import '../../../model/all_vege_infor_dto.dart';
import '../../../model/all_vege_infor_list.dart';
import '../../../view_model/controllers/vege_controller.dart';

class NewVegetableSelect extends StatefulWidget {
  final bool isFarmclub;
  final List<AllVegeInforDto>? allVegeInforList;
  final VegeController vegeController = Get.find();


  NewVegetableSelect({
    super.key,
    required this.allVegeInforList,
    required this.isFarmclub,
  });

  @override
  State<NewVegetableSelect> createState() => _NewVegetableSelectState();
}

class _NewVegetableSelectState extends State<NewVegetableSelect> {
  final VegeController vegeController = Get.find();
  final FarmclubRegisterController _registerController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!vegeController.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            color: FarmusThemeData.brown,
          ));
        } else {
          return Container(
            height: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return widget.isFarmclub != true
                    ? GetBuilder<FarmclubRegisterController>(
                  builder: (controller) {
                    return SizedBox(
                      height: 180, // 아이템의 높이를 조절
                      child: NewVegetableItem(
                        blackPath:
                        widget.allVegeInforList![index].grayImageUrl!,
                        colPath:
                        widget.allVegeInforList![index].imageUrl!,
                        isSelected: controller.isSelectedList[index],
                        onTap: () => {
                          controller.toggleImageSelection(index),
                          if (controller.isSelectedList[index])
                            {
                              // 선택되면 선택한 채소의 데이터를 업데이트합니다.
                              controller.updateSelectedVeggieData(
                                  widget.allVegeInforList![index].id!,
                                  widget
                                      .allVegeInforList![index].imageUrl!,
                                  widget.allVegeInforList![index].name!)
                            }
                        },
                        veggieName: widget.allVegeInforList![index].name!,
                        difficulty:
                        widget.allVegeInforList![index].difficulty!,
                        index: index,
                      ),
                    );
                  },
                )
                    : GetBuilder<VegeController>(
                        builder: (controller) {
                          return SizedBox(
                            height: 180, // 아이템의 높이를 조절
                            child: NewVegetableItem(
                              blackPath:
                                  widget.allVegeInforList![index].grayImageUrl!,
                              colPath:
                                  widget.allVegeInforList![index].imageUrl!,
                              isSelected: controller.isSelectedList[index],
                              onTap: () => {
                                controller.toggleImageSelection(index),
                                if (controller.isSelectedList[index])
                                  {
                                    // 선택되면 선택한 채소의 데이터를 업데이트합니다.
                                    controller.updateSelectedVeggieData(
                                        widget.allVegeInforList![index].id!,
                                        widget
                                            .allVegeInforList![index].imageUrl!,
                                        widget.allVegeInforList![index].name!)
                                  }
                              },
                              veggieName: widget.allVegeInforList![index].name!,
                              difficulty:
                                  widget.allVegeInforList![index].difficulty!,
                              index: index,

                            ),
                          );
                        },
                      );
              },
            ),
          );
        }
      },
    );
  }
}
