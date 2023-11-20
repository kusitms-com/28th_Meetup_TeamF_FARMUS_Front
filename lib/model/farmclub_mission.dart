class FarmclubMission {
  final int postId;
  final String profileImage;
  final String nickName;
  final String date;
  final String image;
  final String content;
  final int like;

  FarmclubMission({
    required this.postId,
    required this.profileImage,
    required this.nickName,
    required this.date,
    required this.image,
    required this.content,
    required this.like,
  });

  factory FarmclubMission.fromJson(Map<String, dynamic> json) {
    return FarmclubMission(
      postId: json['postId'],
      profileImage: json['profileImage'],
      nickName: json['nickName'],
      date: json['date'],
      image: json['image'],
      content: json['content'],
      like: json['like'],
    );
  }
}
