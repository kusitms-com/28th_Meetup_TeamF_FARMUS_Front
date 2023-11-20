class FarmclubMine {
  final int challengeId;
  final int registrationId;
  final String image;
  final String grayImage;

  FarmclubMine({
    required this.challengeId,
    required this.registrationId,
    required this.image,
    required this.grayImage,
  });


  List<FarmclubMine> parseFarmclubMine(List<dynamic> jsonData) {
    return jsonData.map((item) => FarmclubMine.fromJson(item)).toList();
  }

  factory FarmclubMine.fromJson(Map<String, dynamic> json) {
    return FarmclubMine(
      challengeId: json['challengeId'],
      registrationId: json['registrationId'],
      image: json['image'],
      grayImage: json['grayImage'],
    );
  }
}
