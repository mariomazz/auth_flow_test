// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<PhotoDto> photosFromJson(String str) =>
    List<PhotoDto>.from(json.decode(str).map((x) => PhotoDto.fromJson(x)));
List<PhotoDto> photosFromList(List data) =>
    List<PhotoDto>.from(data.map((x) => PhotoDto.fromJson(x)));
String photosToJson(List<PhotoDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoDto {
  PhotoDto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoDto copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      PhotoDto(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  factory PhotoDto.fromJson(Map<String, dynamic> json) => PhotoDto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
