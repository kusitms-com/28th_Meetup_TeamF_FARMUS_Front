class FarmclubMineDetail {
  final String challengeName;
  final String veggieName;
  final String challengeDescription;
  final String veggieImage;

  final String difficulty;
  final int maxUser;
  final int currentUser;
  final int status;
  final List<int> achievement;
  final int stepNum;
  final String stepName;
  final String stepTip;
  final List<String> stepImages;
  final List<dynamic> diaries;

  FarmclubMineDetail({
    required this.challengeName,
    required this.veggieName,
    required this.challengeDescription,
    required this.veggieImage,
    required this.difficulty,
    required this.maxUser,
    required this.currentUser,
    required this.status,
    required this.achievement,
    required this.stepNum,
    required this.stepName,
    required this.stepTip,
    required this.stepImages,
    required this.diaries,
  });

  factory FarmclubMineDetail.fromJson(Map<String, dynamic> json) {
    return FarmclubMineDetail(
      challengeName: json['challengeName'],
      veggieName: json['veggieName'],
      challengeDescription: json['challengeDescription'],
      veggieImage: json['veggieImage'],
      difficulty: json['difficulty'],
      maxUser: json['maxUser'],
      currentUser: json['currentUser'],
      status: json['status'],
      achievement: List<int>.from(json['achievement']),
      stepNum: json['stepNum'],
      stepName: json['stepName'],
      stepTip: json['stepTip'],
      stepImages: List<String>.from(json['stepImages']),
      diaries: List<dynamic>.from(json['diaries']),
    );
  }
}
