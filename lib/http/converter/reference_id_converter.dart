
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/reference_id.dart';
import 'package:json_annotation/json_annotation.dart';

class ReferenceIdConverter implements JsonConverter<ReferenceId, String> {
  const ReferenceIdConverter();

  @override
  ReferenceId fromJson(String json) {
    return ReferenceId(json[0], Id(json.substring(1)));
  }

  @override
  String toJson(ReferenceId object) {
    return object.toString();
  }

}