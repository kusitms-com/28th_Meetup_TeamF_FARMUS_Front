

import 'all_vege_infor_dto.dart';

class AllVegeInforList {
  final List<AllVegeInforDto> allVegeInforList;

  AllVegeInforList({
    required this.allVegeInforList,
  });

  factory AllVegeInforList.fromJson(List<dynamic> jsonList) {
    final List<AllVegeInforDto> routines =
    jsonList.map((vege) => AllVegeInforDto.fromJson(vege)).toList();

    return AllVegeInforList(allVegeInforList: routines);
  }
}