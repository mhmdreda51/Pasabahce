import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uId,
    required super.userName,
    required super.phone,
    required super.email,
    required super.image,
    required super.createdAt,
    required super.userCart,
    required super.userWish,
    required super.deviceToken,
    required super.os,
    required super.userOrders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      os: json['os'] ?? "",
      image: json['image'] ?? "",
      phone: json['phone'] ?? "",
      uId: json['uId'] ?? "",
      userName: json['userName'] ?? "",
      email: json['email'] ?? "",
      createdAt: json['createdAt'],
      userCart: json['userCart'] ?? [],
      userWish: json['userWish'] ?? [],
      deviceToken: json["deviceToken"] ?? "",
      userOrders: json['userOrders'] ?? [],
    );
  }
}
