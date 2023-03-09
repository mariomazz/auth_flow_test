import 'dart:convert';
import 'post.dart';

PaginatedPostsDto paginatedPostsDtoFromJson(String str) =>
    PaginatedPostsDto.fromJson(json.decode(str));

PaginatedPostsDto paginatedPostsDtoFromMap(Map<String, dynamic> data) =>
    PaginatedPostsDto.fromJson(data);

String paginatedPostsDtoToJson(PaginatedPostsDto data) =>
    json.encode(data.toJson());

class PaginatedPostsDto {
  PaginatedPostsDto({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<PostDto> items;

  PaginatedPostsDto copyWith({
    int? totalCount,
    List<PostDto>? items,
  }) =>
      PaginatedPostsDto(
        totalCount: totalCount ?? this.totalCount,
        items: items ?? this.items,
      );

  factory PaginatedPostsDto.fromJson(Map<String, dynamic> json) =>
      PaginatedPostsDto(
        totalCount: json["totalCount"],
        items:
            List<PostDto>.from(json["items"].map((x) => PostDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
