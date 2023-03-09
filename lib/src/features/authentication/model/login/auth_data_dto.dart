import 'dart:convert';

AuthDataDto authDataDtoFromJson(String str) =>
    AuthDataDto.fromJson(json.decode(str));

String authDataDtoToJson(AuthDataDto data) => json.encode(data.toJson());

class AuthDataDto {
  AuthDataDto({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  AuthDataDto copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      AuthDataDto(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory AuthDataDto.fromJson(Map<String, dynamic> json) => AuthDataDto(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
