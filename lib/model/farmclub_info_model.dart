class FarmclubInfoModel {
  final int challengeId;
  final String veggieName;
  final String challengeName;
  final String image;
  final String difficulty;
  final int maxUser;
  final int currentUser;
  final String status;

  FarmclubInfoModel({
    required this.challengeId,
    required this.veggieName,
    required this.challengeName,
    required this.image,
    required this.difficulty,
    required this.maxUser,
    required this.currentUser,
    required this.status,
  });

  factory FarmclubInfoModel.fromJson(Map<String, dynamic> json) {
    List<FarmclubInfoModel> convertData(List<dynamic> dataList) {
      return dataList.map((data) => FarmclubInfoModel.fromJson(data)).toList();
    }

    return FarmclubInfoModel(
      challengeId: json['challengeId'] ?? 0,
      veggieName: json['veggieName'] ?? "",
      challengeName: json['challengeName'] ?? "",
      image: json['image'] ?? "",
      difficulty: json['difficulty'] ?? "",
      maxUser: json['maxUser'] ?? 0,
      currentUser: json['currentUser'] ?? 0,
      status: json['status'] ?? "",
    );
  }
}
