import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RootViewModel extends GetxController {
  // Animation duration
  static const duration = Duration(milliseconds: 200);

  // Platform And DateTime
  late final bool isAndroid;

  // Observable Variables
  late final RxBool _isSignIn;
  late Rx<DateTime> _currentAt;
  late final RxInt _selectedIndex;
  late final RxBool _isEnableGreyBarrier;

  bool get isSignIn => _isSignIn.value;
  DateTime get currentAt => _currentAt.value;
  int get selectedIndex => _selectedIndex.value;
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() async {
    super.onInit();

    // Platform And DateTime Initialize
    isAndroid = GetPlatform.isAndroid;
    _currentAt = DateTime.now().obs;
    _isSignIn = (FirebaseAuth.instance.currentUser != null).obs;

    // Observable Initialize
    _selectedIndex = 1.obs;
    _isEnableGreyBarrier = false.obs;
  }

  void changeIndex(int index) async {
    _selectedIndex.value = index;
    _currentAt.value = DateTime.now();
  }

  void changeMicState() {
    _isEnableGreyBarrier.value = !_isEnableGreyBarrier.value;
  }

  void fetchSignInState() {
    _isSignIn.value = FirebaseAuth.instance.currentUser != null;
  }
}
