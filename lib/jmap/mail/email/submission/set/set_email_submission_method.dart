
import 'package:jmap_dart_client/http/converter/account_id_converter.dart';
import 'package:jmap_dart_client/http/converter/id_converter.dart';
import 'package:jmap_dart_client/http/converter/reference_email_submission_id_converter.dart';
import 'package:jmap_dart_client/http/converter/set/set_method_properties_converter.dart';
import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/capability/capability_identifier.dart';
import 'package:jmap_dart_client/jmap/core/method/request/set_method.dart';
import 'package:jmap_dart_client/jmap/core/patch_object.dart';
import 'package:jmap_dart_client/jmap/core/request/request_invocation.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/email_submission.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/reference_email_submission_id.dart';
import 'package:json_annotation/json_annotation.dart';

class SetEmailSubmissionMethod extends SetMethod<EmailSubmission> with OptionalOnSuccessUpdateEmail, OptionalOnSuccessDestroyEmail  {
  SetEmailSubmissionMethod(AccountId accountId) : super(accountId);

  @override
  MethodName get methodName => MethodName('EmailSubmission/set');

  @override
  Set<CapabilityIdentifier> get requiredCapabilities => {
    CapabilityIdentifier.jmapSubmission,
    CapabilityIdentifier.jmapMail,
    CapabilityIdentifier.jmapCore
  };

  @override
  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{
      'accountId': const AccountIdConverter().toJson(accountId),
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('ifInState', ifInState?.value);
    writeNotNull('create', create
        ?.map((id, create) => SetMethodPropertiesConverter()
        .fromMapIdToJson(id, create.toJson())));
    writeNotNull('update', update
        ?.map((id, update) => SetMethodPropertiesConverter()
        .fromMapIdToJson(id, update.toJson())));
    writeNotNull('destroy', destroy
        ?.map((destroyId) => IdConverter()
        .toJson(destroyId)).toList());
    writeNotNull('onSuccessUpdateEmail', onSuccessUpdateEmail
        ?.map((id, update) => SetMethodPropertiesConverter()
        .fromMapReferenceEmailSubmissionIdToJson(id, update)));
    writeNotNull('onSuccessDestroyEmail', onSuccessDestroyEmail
        ?.map((destroyId) => ReferenceEmailSubmissionIdConverter()
        .toJson(destroyId)).toList());

    return val;
  }

  @override
  List<Object?> get props => [accountId, ifInState, create, update, destroy, onSuccessUpdateEmail, onSuccessDestroyEmail];
}

mixin OptionalOnSuccessUpdateEmail {
  @JsonKey(includeIfNull: false)
  Map<ReferenceEmailSubmissionId, PatchObject>? onSuccessUpdateEmail;

  void addOnSuccessUpdateEmail(Map<ReferenceEmailSubmissionId, PatchObject> values) {
    if (onSuccessUpdateEmail == null) {
      onSuccessUpdateEmail = Map<ReferenceEmailSubmissionId, PatchObject>();
    }
    onSuccessUpdateEmail?.addAll(values);
  }
}

mixin OptionalOnSuccessDestroyEmail {
  @JsonKey(includeIfNull: false)
  Set<ReferenceEmailSubmissionId>? onSuccessDestroyEmail;

  void addOnSuccessDestroyEmail(Set<ReferenceEmailSubmissionId> values) {
    if (onSuccessDestroyEmail == null) {
      onSuccessDestroyEmail = Set();
    }
    onSuccessDestroyEmail?.addAll(values);
  }
}