import 'package:jmap_dart_client/http/converter/id_converter.dart';
import 'package:jmap_dart_client/http/converter/reference_email_submission_id_converter.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/patch_object.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/reference_email_submission_id.dart';

class SetMethodPropertiesConverter {
  MapEntry<String, dynamic> fromMapIdToJson(Id id, dynamic object) {
    return MapEntry(const IdConverter().toJson(id), object);
  }

  MapEntry<String, dynamic> fromMapReferenceEmailSubmissionIdToJson(ReferenceEmailSubmissionId referenceEmailSubmissionId, dynamic object) {
    if (object is PatchObject) {
      return MapEntry(const ReferenceEmailSubmissionIdConverter().toJson(referenceEmailSubmissionId), object.toJson());
    } else {
      return MapEntry(const ReferenceEmailSubmissionIdConverter().toJson(referenceEmailSubmissionId), object);
    }
  }
}