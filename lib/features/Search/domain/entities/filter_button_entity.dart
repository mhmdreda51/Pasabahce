import 'package:equatable/equatable.dart';

class FilterButtonEntity extends Equatable {
  String text;
  bool isSelected;

  FilterButtonEntity({required this.text, required this.isSelected});

  @override
  List<Object> get props => [text, isSelected];
}
