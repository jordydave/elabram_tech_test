import 'package:equatable/equatable.dart';
import 'package:tech_test_elabram/domain/entities/source.dart';

class SourceModel extends Equatable {
  final String? id;
  final String? name;

  const SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'],
        name: json['name'],
      );

  Source toEntity() => Source(
        id: id,
        name: name,
      );

  @override
  List<Object?> get props => [id, name];
}
