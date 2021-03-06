import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  final String name;
  final String noOfSongs;

  const Artist({required this.name, required this.noOfSongs});

  @override
  List<Object?> get props => [name, noOfSongs];
}
