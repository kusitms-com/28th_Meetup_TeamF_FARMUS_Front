


import 'my_vege_routine_dto.dart';

class MyVegeRoutineList {
  final List<MyVegeRoutineDto> diaryPostList;


  MyVegeRoutineList({
    List<MyVegeRoutineDto>? diaryPostList
  }) : diaryPostList = diaryPostList ?? [];


  factory MyVegeRoutineList.fromJson(List<dynamic> jsonList) {
    final routines = jsonList
        .map((vege) => MyVegeRoutineDto.fromJson(vege))
        .toList();

    return MyVegeRoutineList(diaryPostList: routines);
  }
}