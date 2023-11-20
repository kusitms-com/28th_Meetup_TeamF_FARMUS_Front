

import 'package:mojacknong_android/model/routine_dto.dart';

class MyVegeRoutineDto {
  final String? veggieNickname;
  final String? color;
  final List<RoutineDto> routineList;

  MyVegeRoutineDto({
    required this.veggieNickname,
    required this.color,
    required this.routineList,
  });

  factory MyVegeRoutineDto.fromJson(Map<String, dynamic> json) {
    return MyVegeRoutineDto(
      veggieNickname: json['veggieNickname'],
      color: json['color'],
      routineList: (json['routineList'] as List<dynamic>?)
          ?.map((routine) => RoutineDto.fromJson(routine))
          .toList() ??
          [],
    );
  }
}