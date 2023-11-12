class CommunityPosting {
  final int userId;
  final String title;
  final String contents;
  final List<String> postingImage;
  final int postingId;
  final String tag;
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
    required this.tag,
    required this.createdAt,
    required this.commentCount,
    required this.nickName,
    required this.userImageUrl,
  });

  factory CommunityPosting.fromJson(Map<String, dynamic> json) {
    List<String> images = List<String>.from(json['postingImage'] ?? []);

    return CommunityPosting(
      userId: json['userId'] ?? 0,
      title: json['title'] ?? '',
      contents: json['contents'] ?? '',
      postingImage: images,
      postingId: json['postingId'] ?? 0,
      tag: json['tag'] ?? '',
      createdAt: json['created_at'] ?? '',
      commentCount: json['commentCount'] ?? 0,
      nickName: json['nickName'] ?? '',
      userImageUrl: json['userImageUrl'] ?? '',
    );
  }
}
