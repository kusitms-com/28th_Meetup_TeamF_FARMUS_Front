import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_item.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_register_controller.dart';

import '../../../model/all_vege_infor_dto.dart';
import '../../../model/all_vege_infor_list.dart';
import '../../../view_model/controllers/vege_controller.dart';


class NewVegetableSelect extends StatelessWidget {
  final List<AllVegeInforDto>? allVegeInforList;
  final VegeController vegeController = Get.find();



  NewVegetableSelect({
    super.key,
    required this.allVegeInforList
  });

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
                return GetBuilder<VegeController>(
                  builder: (controller) {
                    return SizedBox(
                      height: 180, // 아이템의 높이를 조절
                      child: NewVegetableItem(
                        blackPath: allVegeInforList![index].grayImageUrl!,
                        colPath: allVegeInforList![index].imageUrl!,
                        isSelected: controller.isSelectedList[index],
                        onTap: () => {
                          controller.toggleImageSelection(index),
                          if (controller.isSelectedList[index])
                            {
                              // 선택되면 선택한 채소의 데이터를 업데이트합니다.
                              controller.updateSelectedVeggieData(
                                allVegeInforList![index].id!,
                                allVegeInforList![index].imageUrl!,
                                allVegeInforList![index].name!
                              )
                            }
                        },
                        veggieName: allVegeInforList![index].name!,
                        difficulty: allVegeInforList![index].difficulty!,
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
