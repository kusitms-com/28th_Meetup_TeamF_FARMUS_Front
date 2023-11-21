class Routine {
  final int routineId;
  final String routineName;
  final int period;
  bool isDone;

  Routine({
    required this.routineId,
    required this.routineName,
    required this.period,
    this.isDone = false,
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      routineId: json['routineId'],
      routineName: json['routineName'],
      period: json['period'],
      isDone: json['isDone'],
    );
  }
}
