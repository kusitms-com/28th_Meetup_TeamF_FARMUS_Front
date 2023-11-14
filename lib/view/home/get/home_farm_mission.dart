class FarmClubMission {
  final int stepNum;
  final String nickName;
  final String mission;

  FarmClubMission({
    required this.stepNum,
    required this.nickName,
    required this.mission,
  });

  factory FarmClubMission.fromJson(Map<String, dynamic> json) {
    return FarmClubMission(
      stepNum: json['stepNum'] ?? 0,
      nickName: json['nickName'] ?? '',
      mission: json['mission'] ?? '',
    );
  }
}
