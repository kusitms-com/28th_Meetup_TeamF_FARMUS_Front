class CurrentMissionDto {
  final int? challengeId;
  final String? veggieNickname;
  final int? stepNum;
  final String? stepName;
  final String? color;

  CurrentMissionDto({
    required this.challengeId,
    required this.veggieNickname,
    required this.stepNum,
    required this.stepName,
    required this.color,
  });

  factory CurrentMissionDto.fromJson(Map<String, dynamic> json) {
    return CurrentMissionDto(
      challengeId: json['challengeId'],
      veggieNickname: json['veggieNickname'],
      stepNum: json['stepNum'],
      stepName: json['stepName'],
      color: json['color'],
    );
  }
}

