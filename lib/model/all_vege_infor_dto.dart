class AllVegeInforDto {
  final String? id;
  final String? name;
  final String? difficulty;
  final String? imageUrl;
  final String? grayImageUrl;

  AllVegeInforDto({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.imageUrl,
    required this.grayImageUrl,
  });

  factory AllVegeInforDto.fromJson(Map<String, dynamic> json) {
    return AllVegeInforDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      difficulty: json['difficulty'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      grayImageUrl: json['grayImageUrl'] ?? '',
    );
  }

  static List<AllVegeInforDto> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((e) => AllVegeInforDto.fromJson(e)).toList();
  }
}
