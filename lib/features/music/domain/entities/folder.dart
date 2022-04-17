import 'package:equatable/equatable.dart';

class Folder extends Equatable {
  final String name;
  final int noOfSongs;

  const Folder({required this.name, required this.noOfSongs});

  @override
  List<Object?> get props => [name, noOfSongs];
}
