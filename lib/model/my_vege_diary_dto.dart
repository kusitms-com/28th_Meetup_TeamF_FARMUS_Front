class MyVegeDiaryDto {
  final int? diaryId;
  final String? content;
  final String? image;
  final String? date;

  MyVegeDiaryDto({
    required this.diaryId,
    required this.content,
    required this.image,
    required this.date,
  });

  factory MyVegeDiaryDto.fromJson(Map<String, dynamic> json) {
    return MyVegeDiaryDto(
      diaryId: json['diaryId'] ?? 0,
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
