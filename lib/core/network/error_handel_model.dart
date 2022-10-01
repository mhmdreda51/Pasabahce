import 'package:equatable/equatable.dart';

class ErrorHandelModel extends Equatable {
  final int statusCode;
  final String statusMassage;
  final bool success;

  const ErrorHandelModel({
    required this.statusCode,
    required this.statusMassage,
    required this.success,
  });

  @override
  List<Object?> get props => [statusCode, statusMassage, success];

  factory ErrorHandelModel.fromMap(Map<String, dynamic> map) {
    return ErrorHandelModel(
      statusCode: map['statusCode'] as int,
      statusMassage: map['statusMassage'] as String,
      success: map['success'] as bool,
    );
  }
}
