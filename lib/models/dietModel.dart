class DietModel {
  String? message;
  Data? data;
  bool? status;

  DietModel({this.message, this.data, this.status});

  DietModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? userType;
  String? user;
  String? creatorType;
  String? createdFor;
  String? startDate;
  String? endDate;
  int? total;
  List<DietEntries>? dietEntries;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data({this.userType, this.user, this.creatorType, this.createdFor, this.startDate, this.endDate, this.total, this.dietEntries, this.sId, this.createdAt, this.updatedAt, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    user = json['user'];
    creatorType = json['creatorType'];
    createdFor = json['createdFor'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    total = json['total'];
    if (json['dietEntries'] != null) {
      dietEntries = <DietEntries>[];
      json['dietEntries'].forEach((v) {
        dietEntries!.add(new DietEntries.fromJson(v));
      });
    }
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['user'] = this.user;
    data['creatorType'] = this.creatorType;
    data['createdFor'] = this.createdFor;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['total'] = this.total;
    if (this.dietEntries != null) {
      data['dietEntries'] = this.dietEntries!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DietEntries {
  List<MealEntries>? mealEntries;
  int? day;
  int? totaldiet;
  String? sId;
  String? createdAt;
  String? updatedAt;

  DietEntries({this.mealEntries, this.day, this.totaldiet, this.sId, this.createdAt, this.updatedAt});

  DietEntries.fromJson(Map<String, dynamic> json) {
    if (json['mealEntries'] != null) {
      mealEntries = <MealEntries>[];
      json['mealEntries'].forEach((v) {
        mealEntries!.add(new MealEntries.fromJson(v));
      });
    }
    day = json['day'];
    totaldiet = json['totaldiet'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mealEntries != null) {
      data['mealEntries'] = this.mealEntries!.map((v) => v.toJson()).toList();
    }
    data['day'] = this.day;
    data['totaldiet'] = this.totaldiet;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class MealEntries {
  int? meal;
  List<Mealdata>? mealdata;
  int? totalmeal;
  String? sId;
  String? createdAt;
  String? updatedAt;

  MealEntries({this.meal, this.mealdata, this.totalmeal, this.sId, this.createdAt, this.updatedAt});

  MealEntries.fromJson(Map<String, dynamic> json) {
    meal = json['meal'];
    if (json['mealdata'] != null) {
      mealdata = <Mealdata>[];
      json['mealdata'].forEach((v) {
        mealdata!.add(new Mealdata.fromJson(v));
      });
    }
    totalmeal = json['totalmeal'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meal'] = this.meal;
    if (this.mealdata != null) {
      data['mealdata'] = this.mealdata!.map((v) => v.toJson()).toList();
    }
    data['totalmeal'] = this.totalmeal;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Mealdata {
  String? meal;
  int? qty;
  List<String>? example;
  int? kcal;
  bool? status;
  String? sId;

  Mealdata({this.meal, this.qty, this.example, this.kcal, this.status, this.sId});

  Mealdata.fromJson(Map<String, dynamic> json) {
    meal = json['meal'];
    qty = json['qty'];
    example = json['example'].cast<String>();
    kcal = json['kcal'];
    status = json['status'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meal'] = this.meal;
    data['qty'] = this.qty;
    data['example'] = this.example;
    data['kcal'] = this.kcal;
    data['status'] = this.status;
    data['_id'] = this.sId;
    return data;
  }
}
