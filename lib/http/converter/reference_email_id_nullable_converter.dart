
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/reference_prefix.dart';
import 'package:jmap_dart_client/jmap/mail/email/email.dart';
import 'package:jmap_dart_client/jmap/mail/email/reference_email_id.dart';
import 'package:json_annotation/json_annotation.dart';

class ReferenceEmailIdNullableConverter implements JsonConverter<ReferenceEmailId?, String?> {
  const ReferenceEmailIdNullableConverter();

  @override
  ReferenceEmailId? fromJson(String? json) {
    if (json != null) {
      return ReferenceEmailId(ReferencePrefix(json[0]), EmailId(Id(json.substring(1))));
    } else {
      return null;
    }
  }

  @override
  String? toJson(ReferenceEmailId? object) => object?.toString();
}