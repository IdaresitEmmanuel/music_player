import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class StoragePermissionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SystemFailure extends Failure {
  @override
  List<Object?> get props => [];
}
