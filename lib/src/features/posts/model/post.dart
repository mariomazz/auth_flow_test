import 'dart:convert';

List<PostDto> postDtoFromJson(String str) =>
    List<PostDto>.from(json.decode(str).map((x) => PostDto.fromJson(x)));

List<PostDto> postDtoFromList(List list) =>
    List<PostDto>.from(list.map((x) => PostDto.fromJson(x)));

String postDtoToJson(List<PostDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostDto {
  PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  PostDto copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostDto(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostDto.fromJson(Map<String, dynamic> json) => PostDto(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
