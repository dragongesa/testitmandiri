// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.data,
    required this.status,
    required this.message,
  });

  final List<Datum> data;
  final int status;
  final String message;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.data,
  });

  final String id;
  final Data data;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.gender,
    required this.grade,
    required this.dataClass,
    required this.old,
    required this.nik,
    required this.skill,
  });

  final String name;
  final String gender;
  final int grade;
  final String dataClass;
  final int old;
  final String nik;
  final List<Skill> skill;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    gender: json["gender"],
    grade: json["grade"],
    dataClass: json["class"],
    old: json["old"],
    nik: json["nik"],
    skill: List<Skill>.from(json["skill"].map((x) => Skill.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "grade": grade,
    "class": dataClass,
    "old": old,
    "nik": nik,
    "skill": List<dynamic>.from(skill.map((x) => x.toJson())),
  };
}

class Skill {
  Skill({
    required this.sid,
    required this.name,
  });

  final String sid;
  final String name;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    sid: json["sid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "sid": sid,
    "name": name,
  };
}
