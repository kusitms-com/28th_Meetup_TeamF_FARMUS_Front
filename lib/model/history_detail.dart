

class HistoryDetail {

  final String detailId;
  final String image;
  final String veggieName;
  final String name;
  final String period;

  HistoryDetail({
    required this.detailId,
    required this.image,
    required this.veggieName,
    required this.name,
    required this.period,
  });

  factory HistoryDetail.fromJson(Map<String, dynamic> json) {
    return HistoryDetail(
      detailId: json['detailId'],
      image: json['image'],
      veggieName: json['veggieName'],
      name: json['name'],
      period: json['period'],
    );
  }
}
