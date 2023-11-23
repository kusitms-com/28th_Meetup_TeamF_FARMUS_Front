class MissionMine {
  final int challengeId;
  final String veggieNickname;
  final int stepNum;
  final String stepName;
  final String color;

  MissionMine({
    required this.challengeId,
    required this.veggieNickname,
    required this.stepNum,
    required this.stepName,
    required this.color,
  });

  List<MissionMine> parseMissionMine(List<dynamic> jsonData) {
    return jsonData.map((item) => MissionMine.fromJson(item)).toList();
  }

  factory MissionMine.fromJson(Map<String, dynamic> json) {
    return MissionMine(
      challengeId: json['challengeId'],
      veggieNickname: json['veggieNickname'],
      stepNum: json['stepNum'],
      stepName: json['stepName'],
      color: json['color'],
    );
  }
}
