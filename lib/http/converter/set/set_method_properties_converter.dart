import 'package:jmap_dart_client/http/converter/id_converter.dart';
import 'package:jmap_dart_client/http/converter/reference_id_converter.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/reference_id.dart';

class SetMethodPropertiesConverter {
  MapEntry<String, dynamic> fromMapIdToJson(Id id, dynamic object) {
    return MapEntry(const IdConverter().toJson(id), object);
  }
  MapEntry<String, dynamic> fromMapReferenceIdToJson(ReferenceId referenceId, dynamic object) {
    return MapEntry(const ReferenceIdConverter().toJson(referenceId), object);
  }
}