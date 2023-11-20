class FarmclubDetail {
  final String challengeName;
  final String veggieName;
  final String challengeDescription;
  final String veggieImage;
  final String difficulty;
  final int maxUser;
  final int currentUser;
  final int status;

  FarmclubDetail({
    required this.challengeName,
    required this.veggieName,
    required this.challengeDescription,
    required this.veggieImage,
    required this.difficulty,
    required this.maxUser,
    required this.currentUser,
    required this.status,
  });

  factory FarmclubDetail.fromJson(Map<String, dynamic> json) {
    return FarmclubDetail(
      challengeName: json['challengeName'],
      veggieName: json['veggieName'],
      challengeDescription: json['challengeDescription'],
      veggieImage: json['veggieImage'],
      difficulty: json['difficulty'],
      maxUser: json['maxUser'],
      currentUser: json['currentUser'],
      status: json['status'],
    );
  }
}
