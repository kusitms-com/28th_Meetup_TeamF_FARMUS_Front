class RoutineCheckDto {
  final int routineId;
  final bool isDone;

  RoutineCheckDto({
    required this.routineId,
    required this.isDone,
  });

  factory RoutineCheckDto.fromJson(Map<String, dynamic> json) {
    return RoutineCheckDto(
      routineId: json['routineId'],
      isDone: json['isDone'],
    );
  }
}

class RoutineCreateDto {
  final int routineId;

  RoutineCreateDto({required this.routineId});

  factory RoutineCreateDto.fromJson(Map<String, dynamic> json) {
    return RoutineCreateDto(routineId: json['routineId']);
  }
}
