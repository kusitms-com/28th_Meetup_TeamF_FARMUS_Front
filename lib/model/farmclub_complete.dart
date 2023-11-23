class FarmclubComplete {
  final int veggieId;
  final String image;
  final String challengeName;
  final int day;
  final int mission;
  final int diary;

  FarmclubComplete({
    required this.veggieId,
    required this.image,
    required this.challengeName,
    required this.day,
    required this.mission,
    required this.diary,
  });

  factory FarmclubComplete.fromJson(Map<String, dynamic> json) {
    return FarmclubComplete(
      veggieId: json['veggieId'] ?? 0,
      image: json['image'] ?? "",
      challengeName: json['challengeName'] ?? "",
      day: json['day'] ?? 0,
      mission: json['mission'] ?? 0,
      diary: json['diary'] ?? 0,
    );
  }
}
