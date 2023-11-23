import 'dart:ffi';

class RoutineMonthDto {
  final int veggieId;
  final String veggieNickname;
  final String color;
  final List<RoutineDayDto> routineList;

  RoutineMonthDto(
      {required this.veggieId,
      required this.veggieNickname,
      required this.color,
      required this.routineList});

  factory RoutineMonthDto.fromJson(Map<String, dynamic> json) {
    List<RoutineDayDto> days = [];
    if (json['routineList'] != null) {
      json['routineList'].forEach((dynamic element) {
        dynamic routine = RoutineDayDto.fromJson(element as dynamic);

        days.add(routine);
      });
    }

    return RoutineMonthDto(
        veggieId: json['veggieId'],
        veggieNickname: json['veggieNickname'],
        color: json['color'],
        routineList: days);
  }
}

class RoutineDayDto {
  final int routineId;
  final String routineName;
  final int period;
  final bool isDone;

  RoutineDayDto(
      {required this.routineId,
      required this.routineName,
      required this.period,
      required this.isDone});

  factory RoutineDayDto.fromJson(Map<String, dynamic> json) {
    return RoutineDayDto(
        routineId: json['routineId'] ?? 0,
        routineName: json['routineName'] ?? "",
        period: json['period'] ?? 0,
        isDone: json['isDone'] ?? false);
  }
}
