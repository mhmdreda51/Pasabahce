import '../network/error_handel_model.dart';

class ServerExceptions implements Exception {
  final ErrorHandelModel errorHandelModel;

  ServerExceptions({required this.errorHandelModel});
}

class LocalDataExceptions implements Exception {
  final String massage;

  LocalDataExceptions({required this.massage});
}
