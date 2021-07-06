import 'dart:convert';

import 'package:jmap_dart_client/jmap/core/properties/properties.dart';
import 'package:json_annotation/json_annotation.dart';

class PropertiesConverter implements JsonConverter<Properties?, List<String>?> {
  const PropertiesConverter();

  @override
  Properties? fromJson(List<String>? json) {

  }

  @override
  List<String>? toJson(Properties? object) {
    if (object == null) {
      return null;
    }

    if (object.value.isEmpty) {
      return null;
    }

    return object.value
        .map((element) => jsonEncode(element))
        .toList();
  }
}