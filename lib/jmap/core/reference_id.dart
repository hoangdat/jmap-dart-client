import 'package:equatable/equatable.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';

class ReferenceId with EquatableMixin {
  final String prefix;
  final Id id;

  ReferenceId(this.prefix, this.id);

  @override
  String toString() => '$prefix${id.value}';

  @override
  List<Object?> get props => [prefix, id];
}