

class RoutineDto {
  final int? routineId;
  final String? routineName;
  final int? period;
  final bool? isDone;

  RoutineDto({
    required this.routineId,
    required this.routineName,
    required this.period,
    required this.isDone,
  });

  factory RoutineDto.fromJson(Map<String, dynamic> json) {
    return RoutineDto(
      routineId: json['routineId'],
      routineName: json['routineName'],
      period: json['period'],
      isDone: json['isDone'],
    );
  }
}