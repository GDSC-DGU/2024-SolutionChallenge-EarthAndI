import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/providers/base/base_connect.dart';
import 'package:earth_and_i/providers/notification/notification_provider.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class NotificationProviderImpl extends BaseConnect
    implements NotificationProvider {
  @override
  String get hostUrl => dotenv.env['LOG_SERVER_HOST']!;

  @override
  Future<void> postActionHistoryLogs(
      List<ActionHistoryData> actionHistories) async {
    LogUtil.d('postActionHistoryLogs');

    String? idToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    if (idToken == null) {
      LogUtil.d('idToken is null');
      return;
    }

    LogUtil.d('idToken: $idToken');

    try {
      await post(
        '/v1/serving/actions',
        {
          'data': actionHistories
              .map((e) => {
                    'action': e.type.toString(),
                    'question': e.question.tr,
                    'answer': e.answer,
                    'created_at': e.createdAt.toIso8601String(),
                  })
              .toList()
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );
    } catch (e) {
      LogUtil.d('Error: ${e.toString()}');
      return;
    }
  }
}
