class DiaryPosting {
  // String title;
  String contents;
  // List<File> file;

  DiaryPosting({
    // required this.title,
    required this.contents,
    // required this.tag,
    // required this.file,
  });

  factory DiaryPosting.fromJson(Map<String, dynamic> json) {
    return DiaryPosting(
      // title: json["title"],
      contents: json["contents"],
    );
  }
}
