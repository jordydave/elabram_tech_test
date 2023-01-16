import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String? name;

  const Source({this.id, this.name});

  Source toEntity() => Source(id: id, name: name);
  @override
  List<Object?> get props => [id, name];
}
