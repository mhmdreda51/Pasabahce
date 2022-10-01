import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uId;
  final String os;

  final String deviceToken;
  final String userName;
  final String phone;
  final String email;
  late String image;
  final Timestamp createdAt;
  final List userCart;
  final List userWish;
  final List userOrders;

  UserEntity({
    required this.uId,
    required this.os,
    required this.userName,
    required this.phone,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.userCart,
    required this.userWish,
    required this.deviceToken,
    required this.userOrders,
  });

  @override
  List<Object> get props => [
        uId,
        userName,
        phone,
        email,
        image,
        createdAt,
        userCart,
        userWish,
        deviceToken
      ];
}
