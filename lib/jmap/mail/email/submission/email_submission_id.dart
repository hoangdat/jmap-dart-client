
import 'package:equatable/equatable.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';

class EmailSubmissionId with EquatableMixin {
  final Id id;

  EmailSubmissionId(this.id);

  @override
  List<Object?> get props => [id];
}