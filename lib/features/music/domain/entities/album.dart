import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final String name;
  final String noOfSongs;

  const Album({required this.name, required this.noOfSongs});

  @override
  List<Object?> get props => [name, noOfSongs];
}
