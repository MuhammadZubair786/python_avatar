// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import '../export_all.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.title,
    this.id,
    this.userType,
    this.user,
    this.postMedia,
    this.likesCount,
    this.commentsCount,
    this.createdAt,
    this.like,
  });

  final String? title;
  final String? id;
  final String? userType;
  final UserModel? user;
  final List<PostMedia>? postMedia;
  final int? likesCount;
  final int? commentsCount;
  final String? createdAt;
  final bool? like;

  factory PostModel.fromJson(Map<dynamic, dynamic> json) => PostModel(
        title: json["title"],
        id: json["_id"],
        userType: json["userType"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        postMedia: json["postMedia"] == null ? [] : List<PostMedia>.from(json["postMedia"]!.map((x) => PostMedia.fromJson(x))),
        likesCount: json["likesCount"],
        commentsCount: json["commentsCount"],
        createdAt: json["createdAt"] ?? '',
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "_id": id,
        "userType": userType,
        "user": user?.toJson(),
        "postMedia": postMedia == null ? [] : List<dynamic>.from(postMedia!.map((x) => x.toJson())),
        "likesCount": likesCount,
        "commentsCount": commentsCount,
        "like": like,
      };
}

class PostMedia {
  PostMedia({
    this.file,
  });

  final String? file;

  factory PostMedia.fromJson(Map<dynamic, dynamic> json) => PostMedia(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}
