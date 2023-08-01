class Nutrition {
  String? message;
  List<Data>? data;
  bool? status;

  Nutrition({this.message, this.data, this.status});

  Nutrition.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? sId;
  String? userType;
  String? user;
  String? creatorType;
  String? createdFor;
  List<NutritionEntries>? nutritionEntries;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.userType,
      this.user,
      this.creatorType,
      this.createdFor,
      this.nutritionEntries,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userType = json['userType'];
    user = json['user'];
    creatorType = json['creatorType'];
    createdFor = json['createdFor'];
    if (json['nutritionEntries'] != null) {
      nutritionEntries = <NutritionEntries>[];
      json['nutritionEntries'].forEach((v) {
        nutritionEntries!.add(new NutritionEntries.fromJson(v));
      });
    }
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userType'] = this.userType;
    data['user'] = this.user;
    data['creatorType'] = this.creatorType;
    data['createdFor'] = this.createdFor;
    if (this.nutritionEntries != null) {
      data['nutritionEntries'] =
          this.nutritionEntries!.map((v) => v.toJson()).toList();
    }
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class NutritionEntries {
  String? sId;
  List<MealEntries>? mealEntries;
  String? nutritionPlan;
  int? day;
  String? title;
  String? startTime;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCal;

  NutritionEntries(
      {this.sId,
      this.mealEntries,
      this.nutritionPlan,
      this.day,
      this.title,
      this.startTime,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCal});

  NutritionEntries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['mealEntries'] != null) {
      mealEntries = <MealEntries>[];
      json['mealEntries'].forEach((v) {
        mealEntries!.add(new MealEntries.fromJson(v));
      });
    }
    nutritionPlan = json['nutritionPlan'];
    day = json['day'];
    title = json['title'];
    startTime = json['startTime'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCal = json['totalCal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.mealEntries != null) {
      data['mealEntries'] = this.mealEntries!.map((v) => v.toJson()).toList();
    }
    data['nutritionPlan'] = this.nutritionPlan;
    data['day'] = this.day;
    data['title'] = this.title;
    data['startTime'] = this.startTime;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['totalCal'] = this.totalCal;
    return data;
  }
}

class MealEntries {
  String? sId;
  Null meal;
  int? qty;
  List<String>? diet;
  int? kcal;
  String? entryType;
  String? entry;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MealEntries(
      {this.sId,
      this.meal,
      this.qty,
      this.diet,
      this.kcal,
      this.entryType,
      this.entry,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MealEntries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    meal = json['meal'];
    qty = json['qty'];
    diet = json['diet'].cast<String>();
    kcal = json['kcal'];
    entryType = json['entryType'];
    entry = json['entry'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['meal'] = this.meal;
    data['qty'] = this.qty;
    data['diet'] = this.diet;
    data['kcal'] = this.kcal;
    data['entryType'] = this.entryType;
    data['entry'] = this.entry;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
