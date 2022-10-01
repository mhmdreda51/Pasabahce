import 'package:equatable/equatable.dart';

class IntroEntity extends Equatable {
  final String imagePath;
  final String title;
  final String subTitle;
  final String price;
  const IntroEntity({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
  });
  
  @override

  List<Object?> get props =>[imagePath,title,price,subTitle];

}
