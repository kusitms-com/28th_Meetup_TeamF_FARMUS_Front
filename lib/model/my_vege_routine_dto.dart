import 'package:mojacknong_android/model/routine_dto.dart';

class MyVegeRoutineDto {
  final int? veggieId;
  final String? veggieNickname;
  final String? color;
  final List<RoutineDto> routineList;

  MyVegeRoutineDto({
    this.veggieId,
    required this.veggieNickname,
    required this.color,
    required this.routineList,
  });

  factory MyVegeRoutineDto.fromJson(Map<String, dynamic> json) {
    return MyVegeRoutineDto(
      veggieId: json['veggieId'],
      veggieNickname: json['veggieNickname'],
      color: json['color'],
      routineList: (json['routineList'] as List<dynamic>?)
              ?.map((routine) => RoutineDto.fromJson(routine))
              .toList() ??
          [],
    );
  }
}
