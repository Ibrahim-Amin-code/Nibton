import 'dart:convert';

class LoginModel {
  bool? status;
  String? msg;
  Data? data;

  LoginModel({this.status, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null);
  }
}

class Data {
  late int id;
  late dynamic countryId;
  late dynamic cityId;
  late dynamic stateID;
  late String name;
  late String email;
  late var dateOfBirth;
  late String mobile;
  late String photo;
  late dynamic gender;
  late dynamic detail;
  late int status;
  late String type;
  late int isActivated;
  late String token;
  late String deviceToken;
  late String createdAt;
  late String updatedAt;

  Data({
    required this.id,
    required this.countryId,
    required this.cityId,
    required this.stateID,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.mobile,
    required this.photo,
    required this.gender,
    required this.detail,
    required this.status,
    required this.type,
    required this.isActivated,
    required this.token,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    stateID = json['stateID'];
    name = json['name'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    mobile = json['mobile'];
    photo = json['photo'];
    gender = json['gender'];
    detail = json['detail'];
    status = json['status'];
    type = json['type'];
    isActivated = json['is_activated'];
    token = json['token'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'];
  }
}

class Country {
  late int id;
  late String nameAr;
  late String nameEn;
  late dynamic createdAt;
  late dynamic updatedAt;

  Country(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
