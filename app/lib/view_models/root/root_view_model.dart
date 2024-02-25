import 'package:earth_and_i/utilities/functions/notification_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Static Fields ---------------------- */
  /* ------------------------------------------------------ */
  static const duration = Duration(milliseconds: 200);

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late Rx<DateTime> _currentAt;
  late final RxInt _selectedIndex;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  DateTime get currentAt => _currentAt.value;
  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() async {
    super.onInit();

    // FCM Setting
    FirebaseMessaging.onMessage
        .listen(NotificationUtil.showFlutterNotification);
    FirebaseMessaging.onBackgroundMessage(NotificationUtil.onBackgroundHandler);

    // Private Fields
    _currentAt = DateTime.now().obs;
    _selectedIndex = 1.obs;
  }

  void changeIndex(int index) async {
    _selectedIndex.value = index;
    _currentAt.value = DateTime.now();
  }
}
