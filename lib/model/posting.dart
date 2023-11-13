import 'dart:io';

class Posting {
  String title;
  String contents;
  String tag;
  List<File> file;

  Posting({
    required this.title,
    required this.contents,
    required this.tag,
    required this.file,
  });

  factory Posting.fromJson(Map<String, dynamic> json) {
    return Posting(
      title: json["title"],
      contents: json["contents"],
      tag: json['tag'],
      file: json['file'],
    );
  }
}
