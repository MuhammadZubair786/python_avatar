// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.fullName,
    required this.follower,
    required this.following,
    required this.routine,
    required this.nutrition,
    required this.dietplane,
    this.userType,
    // this.image,
    this.isCompleteProfile,
    this.token,
    // this.post,
    this.notificationOn,
    this.age,
    this.experience,
    this.skills,
    this.bio,
    this.workingAt,
    this.address,
  });

  final String id;
  final String? fullName;
  final int? follower;
  final int? following;
  final List<dynamic>? routine;
  final List<dynamic>? nutrition;
  final List<dynamic>? dietplane;
  final String? userType;
  // final String? image;
  final bool? isCompleteProfile;
  final String? token;
  // final List<dynamic>? post;
  final bool? notificationOn;
  final int? age;
  final String? experience;
  final String? skills;
  final String? bio;
  final String? workingAt;
  final String? address;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["_id"],
        fullName: json["fullName"] ?? '',
        follower: json["follower"] ?? 0,
        following: json["following"] ?? 0,
        routine: json.containsKey('routine') ? List<dynamic>.from(json["routine"].map((x) => x)) : null,
        nutrition: json.containsKey('nutrition') ? List<dynamic>.from(json["nutrition"].map((x) => x)) : null,
        dietplane: json.containsKey('dietplane') ? List<dynamic>.from(json["dietplane"].map((x) => x)) : null,
        userType: json["userType"] ?? '',
        // image: json["image"] ?? '',
        isCompleteProfile: json["isCompleteProfile"] ?? false,
        token: json["token"] ?? '',
        // post: List<dynamic>.from(json["post"].map((x) => x)),
        notificationOn: json["notificationOn"] ?? true,
        age: json["age"] ?? 0,
        experience: json["experience"] ?? '',
        skills: json["skills"] ?? '',
        bio: json["bio"] ?? '',
        workingAt: json["workingAt"] ?? '',
        address: json["address"] ?? '',
      );

  String toRawJson() => json.encode(toJson());

  Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "follower": follower,
        "following": following,
        "routine": List<dynamic>.from(routine!.map((x) => x)),
        "nutrition": List<dynamic>.from(nutrition!.map((x) => x)),
        "dietplane": List<dynamic>.from(dietplane!.map((x) => x)),
        "userType": userType,
        // "image": image,
        "isCompleteProfile": isCompleteProfile,
        "token": token,
        // "post": List<dynamic>.from(post!.map((x) => x)),
        "notificationOn": notificationOn,
        "age": age,
        "experience": experience,
        "skills": skills,
        "bio": bio,
        "workingAt": workingAt,
        "address": address,
      };
}

class UserImageModel {
  final String? file;

  String toRawJson() => json.encode(toJson());

  Map<dynamic, dynamic> toJson() => {
        "file": file,
      };

  UserImageModel({
    this.file,
  });

  factory UserImageModel.fromJson(Map<dynamic, dynamic> json) => UserImageModel(
        file: json["file"],
      );
}



// class UserModel {
//   String? fullName;
//   Location? location;
//   List<Null>? post;
//   List<Null>? follower;
//   List<Null>? friends;
//   List<Null>? following;
//   List<Null>? dietplane;
//   List<Null>? routine;
//   List<Null>? nutrition;
//   String? sId;
//   String? createdAt;
//   String? updatedAt;
//   String? token;
//   int? iV;

//   UserModel(
//       {this.fullName,
//       this.sId,
//       this.createdAt,
//       this.updatedAt,
//       this.token,
//       this.iV});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     fullName = json['fullName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fullName'] = this.fullName;

//     data['_id'] = this.sId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class Location {
//   String? type;
//   List<int>? coordinates;

//   Location({this.type, this.coordinates});

//   Location.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<int>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
// }
