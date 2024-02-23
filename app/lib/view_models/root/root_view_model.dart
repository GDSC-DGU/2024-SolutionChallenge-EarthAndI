import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
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

    // Private Fields
    _currentAt = DateTime.now().obs;
    _selectedIndex = 1.obs;
  }

  void changeIndex(int index) async {
    _selectedIndex.value = index;
    _currentAt.value = DateTime.now();
  }
}
