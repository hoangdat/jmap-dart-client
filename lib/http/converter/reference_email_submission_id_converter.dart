
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/reference_prefix.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/email_submission_id.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/reference_email_submission_id.dart';
import 'package:json_annotation/json_annotation.dart';

class ReferenceEmailSubmissionIdConverter implements JsonConverter<ReferenceEmailSubmissionId, String> {
  const ReferenceEmailSubmissionIdConverter();

  @override
  ReferenceEmailSubmissionId fromJson(String json) {
    return ReferenceEmailSubmissionId(ReferencePrefix(json[0]), EmailSubmissionId(Id(json.substring(1))));
  }

  @override
  String toJson(ReferenceEmailSubmissionId object) {
    return object.toString();
  }
}