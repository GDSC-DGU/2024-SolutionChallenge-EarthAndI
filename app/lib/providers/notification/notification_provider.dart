import 'package:earth_and_i/apps/database/local_database.dart';

abstract class NotificationProvider {
  Future<void> postActionHistoryLogs(List<ActionHistoryData> actionHistories);
  Future<void> postMessageLogs(String receiverId, String message);
}
