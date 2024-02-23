import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final FirebaseAuth _firebaseAuth;
  late final UserRepository _userRepository;

  late final String? _beforeRoute;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isEnableGreyBarrier;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() {
    super.onInit();
    // DI Fields
    _firebaseAuth = FirebaseAuth.instance;
    _userRepository = Get.find<UserRepository>();

    _beforeRoute = Get.arguments?['beforeRoute'];

    // Private Fields
    _isEnableGreyBarrier = false.obs;
  }

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return false;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final UserCredential userCredential;
    try {
      _isEnableGreyBarrier.value = true;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      userCredential = await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      LogUtil.e('Error: $e');
      return false;
    }

    await _userRepository.updateUserBriefInformation(
      id: userCredential.user?.uid.substring(0, 5) ?? '',
      nickname: userCredential.user?.displayName ?? '',
    );

    if (_beforeRoute != null && _beforeRoute == '/setting') {
      Get.find<SettingViewModel>().fetchSignInState();
    }

    Get.find<ProfileViewModel>().fetchUserBriefState();
    _isEnableGreyBarrier.value = false;

    return true;
  }
}
