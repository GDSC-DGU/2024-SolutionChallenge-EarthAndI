import 'package:earth_and_i/providers/notification/notification_provider.dart';
import 'package:earth_and_i/repositories/notification_repository.dart';
import 'package:get/get.dart';

class NotificationRepositoryImpl extends GetxService
    implements NotificationRepository {
  late final NotificationProvider _notificationProvider;

  @override
  void onInit() {
    super.onInit();

    _notificationProvider = Get.find<NotificationProvider>();
  }

  @override
  Future<bool> createNotification(String receiverId, String message) async {
    try {
      await _notificationProvider.postMessageLogs(
        receiverId,
        message,
      );
    } catch (e) {
      return false;
    }

    return true;
  }
}
