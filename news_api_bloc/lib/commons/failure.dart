import 'package:equatable/equatable.dart';
import 'package:news_api/commons/constants.dart';

abstract class Failure extends Equatable {
  final String message;
  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({String message='Server Failure (server gagal)'}):super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure({String message=connectionErrorMessage}):super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message):super(message);
}

class UknownFailure extends Failure {
  UknownFailure():super('Unknown error occured (terjadi error)');
}