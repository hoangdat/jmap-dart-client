import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:jmap_dart_client/http/http_client.dart';
import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/id.dart';
import 'package:jmap_dart_client/jmap/core/patch_object.dart';
import 'package:jmap_dart_client/jmap/core/reference_id.dart';
import 'package:jmap_dart_client/jmap/jmap_request.dart';
import 'package:jmap_dart_client/jmap/mail/email/email.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/address.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/email_submission.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/envelope.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/set/set_email_submission_method.dart';
import 'package:jmap_dart_client/jmap/mail/email/submission/set/set_email_submission_response.dart';

void main() {
  group('test to json set email submission method', () {
    final expectedCreated =
        EmailSubmission(id: Id('84c73cc3-4480-4ff9-a031-ff324ea36d7e'));

    test('set email submission method and response parsing', () async {
      final baseOption = BaseOptions(method: 'POST');
      final dio = Dio(baseOption)..options.baseUrl = 'http://domain.com';
      final dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onPost(
          '/jmap',
          (server) => server.reply(200, {
                "sessionState": "2c9f1b12-b35a-43e6-9af2-0106fb53a943",
                "methodResponses": [
                  [
                    "EmailSubmission/set",
                    {
                      "accountId":
                          "3ce33c876a726662c627746eb9537a1d13c2338193ef27bd051a3ce5c0fe5b12",
                      "newState": "2c9f1b12-b35a-43e6-9af2-0106fb53a943",
                      "created": {
                        "dab1234": {
                          "id": "84c73cc3-4480-4ff9-a031-ff324ea36d7e"
                        }
                      }
                    },
                    "c0"
                  ],
                  [
                    "Email/set",
                    {
                      "accountId":
                          "3ce33c876a726662c627746eb9537a1d13c2338193ef27bd051a3ce5c0fe5b12",
                      "oldState": "9a333e40-0a25-11ec-b57c-2fef1ee78d9e",
                      "newState": "9a333e40-0a25-11ec-b57c-2fef1ee78d9e",
                      "updated": {"eb519670-05cd-11ec-b153-2fef1ee78d9e": null}
                    },
                    "c0"
                  ]
                ]
              }),
          data: {
            "methodCalls": [
              [
                "EmailSubmission/set",
                {
                  "accountId":
                      "3ce33c876a726662c627746eb9537a1d13c2338193ef27bd051a3ce5c0fe5b12",
                  "create": {
                    "dab1234": {
                      "identityId": "a123456",
                      "emailId": "eb519670-05cd-11ec-b153-2fef1ee78d9e",
                      "envelope": {
                        "mailFrom": {
                          "email": "userb@qa.open-paas.org",
                          "parameters": null
                        },
                        "rcptTo": [
                          {
                            "email": "usera@qa.open-paas.org",
                            "parameters": null
                          }
                        ]
                      }
                    }
                  },
                  "onSuccessUpdateEmail": {
                    "#dab1234": {
                      "mailboxIds/abc66d50-18d9-11eb-a677-2990b970028d": null,
                      "mailboxIds/abb99c10-18d9-11eb-a677-2990b970028d": true,
                      "keywords/\$draft": null
                    }
                  }
                },
                "c0"
              ]
            ],
            "using": [
              "urn:ietf:params:jmap:submission",
              "urn:ietf:params:jmap:mail",
              "urn:ietf:params:jmap:core"
            ]
          },
          headers: {
            "accept": "application/json;jmapVersion=rfc-8621"
          });

      final setEmailSubmissionMethod = SetEmailSubmissionMethod(AccountId(Id(
          '3ce33c876a726662c627746eb9537a1d13c2338193ef27bd051a3ce5c0fe5b12')))
        ..addCreate(
            Id('dab1234'),
            EmailSubmission(
                identityId: Id('a123456'),
                emailId: EmailId(Id('eb519670-05cd-11ec-b153-2fef1ee78d9e')),
                envelope: Envelope(Address('userb@qa.open-paas.org', null),
                    {Address('usera@qa.open-paas.org', null)})))
        ..addOnSuccessUpdateEmail({
          ReferenceId('#', Id('dab1234')): PatchObject({
            "mailboxIds/abc66d50-18d9-11eb-a677-2990b970028d": null,
            "mailboxIds/abb99c10-18d9-11eb-a677-2990b970028d": true,
            "keywords/\$draft": null
          }).patches
        });

      final httpClient = HttpClient(dio);
      final requestBuilder =
          JmapRequestBuilder(httpClient, ProcessingInvocation());
      final setEmailInvocation =
          requestBuilder.invocation(setEmailSubmissionMethod);
      final response = await (requestBuilder
            ..usings(setEmailSubmissionMethod.requiredCapabilities))
          .build()
          .execute();

      final setEmailSubmissionResponse =
          response.parse<SetEmailSubmissionResponse>(
              setEmailInvocation.methodCallId,
              SetEmailSubmissionResponse.deserialize);

      expect(setEmailSubmissionResponse?.created?[Id('dab1234')],
          equals(expectedCreated));
    });
  });
}
