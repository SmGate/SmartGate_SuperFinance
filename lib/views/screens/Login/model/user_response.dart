// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool? success;
  Data? data;
  String? bearer;

  User({
    this.success,
    this.data,
    this.bearer,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        bearer: json["Bearer"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "Bearer": bearer,
      };
}

class Data {
  int? id;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  int? roleid;
  String? rolename;
  String? image;
  dynamic fcmtoken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? financemanagerid;
  int? subadminid;
  int? superadminid;
  int? societyid;
  String? status;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.cnic,
    this.address,
    this.mobileno,
    this.roleid,
    this.rolename,
    this.image,
    this.fcmtoken,
    this.createdAt,
    this.updatedAt,
    this.financemanagerid,
    this.subadminid,
    this.superadminid,
    this.societyid,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        cnic: json["cnic"],
        address: json["address"],
        mobileno: json["mobileno"],
        roleid: json["roleid"],
        rolename: json["rolename"],
        image: json["image"],
        fcmtoken: json["fcmtoken"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        financemanagerid: json["financemanagerid"],
        subadminid: json["subadminid"],
        superadminid: json["superadminid"],
        societyid: json["societyid"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "cnic": cnic,
        "address": address,
        "mobileno": mobileno,
        "roleid": roleid,
        "rolename": rolename,
        "image": image,
        "fcmtoken": fcmtoken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "financemanagerid": financemanagerid,
        "subadminid": subadminid,
        "superadminid": superadminid,
        "societyid": societyid,
        "status": status,
      };
}
