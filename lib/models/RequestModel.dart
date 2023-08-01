class Welcome {
    String message;
    List<Datum> data;
    bool status;

    Welcome({
        required this.message,
        required this.data,
        required this.status,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    String id;
    String requestType;
    String status;
    String senderType;
    SenderId senderId;
    String receiverType;
    String receiverId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.requestType,
        required this.status,
        required this.senderType,
        required this.senderId,
        required this.receiverType,
        required this.receiverId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        requestType: json["requestType"],
        status: json["status"],
        senderType: json["senderType"],
        senderId: SenderId.fromJson(json["senderID"]),
        receiverType: json["receiverType"],
        receiverId: json["receiverID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "requestType": requestType,
        "status": status,
        "senderType": senderType,
        "senderID": senderId.toJson(),
        "receiverType": receiverType,
        "receiverID": receiverId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SenderId {
    String id;
    String fullName;
    String auth;
    List<String> post;
    List<dynamic> follower;
    List<String> following;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String address;
    int age;
    String bio;
    List<String> certificate;
    String experience;
    String image;
    String skills;
    String workingAt;
    String dietplane;

    SenderId({
        required this.id,
        required this.fullName,
        required this.auth,
        required this.post,
        required this.follower,
        required this.following,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.address,
        required this.age,
        required this.bio,
        required this.certificate,
        required this.experience,
        required this.image,
        required this.skills,
        required this.workingAt,
        required this.dietplane,
    });

    factory SenderId.fromJson(Map<String, dynamic> json) => SenderId(
        id: json["_id"],
        fullName: json["fullName"],
        auth: json["auth"],
        post: List<String>.from(json["post"].map((x) => x)),
        follower: List<dynamic>.from(json["follower"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"],
        age: json["age"],
        bio: json["bio"],
        certificate: List<String>.from(json["certificate"].map((x) => x)),
        experience: json["experience"],
        image: json["image"],
        skills: json["skills"],
        workingAt: json["workingAt"],
        dietplane: json["dietplane"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "auth": auth,
        "post": List<dynamic>.from(post.map((x) => x)),
        "follower": List<dynamic>.from(follower.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "address": address,
        "age": age,
        "bio": bio,
        "certificate": List<dynamic>.from(certificate.map((x) => x)),
        "experience": experience,
        "image": image,
        "skills": skills,
        "workingAt": workingAt,
        "dietplane": dietplane,
    };
}