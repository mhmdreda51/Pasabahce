import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String uId;
  late String userName;
  late String phone;
  late String email;
  late String? image;
  late Timestamp createdAt;
  late List? userCart;
  late List? userWish;

  UserModel({
    required this.uId,
    required this.userName,
    required this.phone,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.userCart,
    required this.userWish,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    userName = json['userName'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'] ?? "";
    createdAt = json['createdAt'];
    userCart = json['userCart'];
    userWish = json['userWish'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userName': userName,
      'phone': phone,
      'email': email,
      'userCart': userCart!.map((e) => e.toMap()).toList(),
      'userWish': userWish!.map((e) => e.toMap()).toList(),
      'createdAt': createdAt,
      'image': image,
    };
  }
}
