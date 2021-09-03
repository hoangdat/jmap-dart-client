
import 'package:equatable/equatable.dart';
import 'package:jmap_dart_client/jmap/core/reference_prefix.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/email_submission_id.dart';

class ReferenceEmailSubmissionId extends EmailSubmissionId with EquatableMixin {
  final ReferencePrefix prefix;
  final EmailSubmissionId emailSubmissionId;

  ReferenceEmailSubmissionId(this.prefix, this.emailSubmissionId) : super(emailSubmissionId.id);

  @override
  String toString() => '${prefix.value}${emailSubmissionId.id.value}';

  @override
  List<Object?> get props => [prefix, emailSubmissionId];
}