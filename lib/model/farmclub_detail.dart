class FarmclubDetail {
  final String veggieInfoId;
  final String challengeName;
  final String veggieName;
  final String challengeDescription;
  final String veggieImage;
  final String difficulty;
  final int maxUser;
  final int currentUser;
  final int status;
  final int? achievement;
  final int stepNum;
  final String stepName;
  final String stepTip;
  final List<String> stepImages;
  final bool isRegistered;

  FarmclubDetail({
    required this.veggieInfoId,
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
    required this.isRegistered,
  });

  factory FarmclubDetail.fromJson(Map<String, dynamic> json) {
    // 'data' 필드가 없는 경우를 고려하여 수정
    final jsonData = json;

    return FarmclubDetail(
      veggieInfoId: jsonData['veggieInfoId'],
      challengeName: jsonData['challengeName'],
      veggieName: jsonData['veggieName'],
      challengeDescription: jsonData['challengeDescription'],
      veggieImage: jsonData['veggieImage'],
      difficulty: jsonData['difficulty'],
      maxUser: jsonData['maxUser'],
      currentUser: jsonData['currentUser'],
      status: jsonData['status'],
      achievement: jsonData['achievement'],
      stepNum: jsonData['stepNum'],
      stepName: jsonData['stepName'],
      stepTip: jsonData['stepTip'],
      stepImages: List<String>.from(jsonData['stepImages']),
      isRegistered: jsonData['isRegistered'],
    );
  }
}
