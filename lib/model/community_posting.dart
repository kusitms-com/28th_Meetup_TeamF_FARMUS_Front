class CommunityPosting {
  final int userId;
  final String title;
  final String contents;
  final List<String> postingImage;
  final int postingId;
  final List<String> tagName;
  final String createdAt;
  final int commentCount;
  final String nickName;
  final String userImageUrl;

  CommunityPosting({
    required this.userId,
    required this.title,
    required this.contents,
    required this.postingImage,
    required this.postingId,
    required this.tagName,
    required this.createdAt,
    required this.commentCount,
    required this.nickName,
    required this.userImageUrl,
  });

  factory CommunityPosting.fromJson(Map<String, dynamic> json) {
    return CommunityPosting(
      userId: json['userId'],
      title: json['title'],
      contents: json['contents'],
      postingImage: List<String>.from(json['postingImage']),
      postingId: json['postingId'],
      tagName: List<String>.from(json['tagName']),
      createdAt: json['created_at'],
      commentCount: json['commentCount'],
      nickName: json['nickName'],
      userImageUrl: json['userImageUrl'],
    );
  }
}
