// To parse this JSON data, do
//
//     final generateSoloBill = generateSoloBillFromJson(jsonString);

import 'dart:convert';

GenerateSoloBill generateSoloBillFromJson(String str) =>
    GenerateSoloBill.fromJson(json.decode(str));

String generateSoloBillToJson(GenerateSoloBill data) =>
    json.encode(data.toJson());

class GenerateSoloBill {
  bool? success;
  String? message;

  GenerateSoloBill({
    this.success,
    this.message,
  });

  factory GenerateSoloBill.fromJson(Map<String, dynamic> json) =>
      GenerateSoloBill(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
