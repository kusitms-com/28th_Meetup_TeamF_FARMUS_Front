
class FarmclubRecommend {
  final int challengeId;
  final String veggieName;
  final String challengeName;
  final String image;
  final String difficulty;
  final int maxUser;
  final int currentUser;
  final String status;

  FarmclubRecommend({
    required this.challengeId,
    required this.veggieName,
    required this.challengeName,
    required this.image,
    required this.difficulty,
    required this.maxUser,
    required this.currentUser,
    required this.status,
  });

  factory FarmclubRecommend.fromJson(Map<String, dynamic> json) {
    return FarmclubRecommend(
      challengeId: json['challengeId'],
      veggieName: json['veggieName'],
      challengeName: json['challengeName'],
      image: json['image'],
      difficulty: json['difficulty'],
      maxUser: json['maxUser'],
      currentUser: json['currentUser'],
      status: json['status'],
    );
  }
}
