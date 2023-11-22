class FarmclubMyMission {
  final int postId;
  final int stepNum;
  final String stepName;
  final String date;
  final String image;
  final String content;
  final int likeNum;

  FarmclubMyMission({
    required this.postId,
    required this.stepNum,
    required this.stepName,
    required this.date,
    required this.image,
    required this.content,
    required this.likeNum,
  });

  factory FarmclubMyMission.fromJson(Map<String, dynamic> json) {
    return FarmclubMyMission(
      postId: json['postId'] as int,
      stepNum: json['stepNum'] as int,
      stepName: json['stepName'] as String,
      date: json['date'] as String,
      image: json['image'] as String,
      content: json['content'] as String,
      likeNum: json['likeNum'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'stepNum': stepNum,
      'stepName': stepName,
      'date': date,
      'image': image,
      'content': content,
      'likeNum': likeNum,
    };
  }
}
