import 'package:equatable/equatable.dart';
import 'package:jmap_dart_client/jmap/core/reference_prefix.dart';
import 'package:jmap_dart_client/jmap/mail/email/email.dart';

class ReferenceEmailId extends EmailId with EquatableMixin {
  final ReferencePrefix prefix;
  final EmailId emailId;

  ReferenceEmailId(this.prefix, this.emailId) : super(emailId.id);

  @override
  String toString() => '${prefix.value}${emailId.id.value}';

  @override
  List<Object?> get props => [prefix, emailId];
}