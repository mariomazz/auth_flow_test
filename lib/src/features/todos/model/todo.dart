// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<TodoDto> todosFromJson(String str) =>
    List<TodoDto>.from(json.decode(str).map((x) => TodoDto.fromJson(x)));
List<TodoDto> todosFromList(List data) =>
    List<TodoDto>.from(data.map((x) => TodoDto.fromJson(x)));
String todosToJson(List<TodoDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoDto {
  TodoDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoDto copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) =>
      TodoDto(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );

  factory TodoDto.fromJson(Map<String, dynamic> json) => TodoDto(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
