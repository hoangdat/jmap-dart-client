import 'package:jmap_dart_client/http/converter/account_id_converter.dart';
import 'package:jmap_dart_client/http/converter/id_converter.dart';
import 'package:jmap_dart_client/http/converter/state_converter.dart';
import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/method/response/changes_response.dart';
import 'package:jmap_dart_client/jmap/core/state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'changes_email_response.g.dart';

@IdConverter()
@StateConverter()
@AccountIdConverter()
@JsonSerializable()
class ChangesEmailResponse extends ChangesResponse {
  ChangesEmailResponse(
      AccountId accountId,
      State oldState,
      State newState,
      bool hasMoreChanges,
      Set<Id> created,
      Set<Id> updated,
      Set<Id> destroyed
  ) : super(accountId, oldState, newState, hasMoreChanges, created, updated, destroyed);

  factory ChangesEmailResponse.fromJson(Map<String, dynamic> json) => _$ChangesEmailResponseFromJson(json);

  static ChangesEmailResponse deserialize(Map<String, dynamic> json) {
    return ChangesEmailResponse.fromJson(json);
  }

  @override
  List<Object?> get props => [accountId, oldState, newState, hasMoreChanges, created, updated, destroyed];
}