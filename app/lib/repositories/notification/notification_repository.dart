abstract class NotificationRepository {
  Future<bool> createNotification(String receiverId, String message);
}
