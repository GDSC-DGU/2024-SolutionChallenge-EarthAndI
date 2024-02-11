import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;

class RootViewModel extends GetxController {
  // Animation duration
  static const duration = Duration(milliseconds: 200);

  late final ActionHistoryRepository _actionHistoryRepository;
  late final UserRepository _userRepository;

  // Platform And DateTime
  late final bool isAndroid;
  late DateTime _currentDate;

  // Observable Variables
  late final RxInt _selectedIndex;
  late final RxBool _isEnableGreyBarrier;

  int get selectedIndex => _selectedIndex.value;
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() async {
    super.onInit();
    // Dependency Injection
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();
    _userRepository = Get.find<UserRepository>();

    // Platform And DateTime Initialize
    isAndroid =
        (foundation.defaultTargetPlatform == foundation.TargetPlatform.android);
    _currentDate = DateTime.now();

    // Observable Initialize
    _selectedIndex = 1.obs;
    _isEnableGreyBarrier = false.obs;

    // Load And Save Data
    await initializeOrNoneUsers();
    await loadAndSaveSteps();
  }

  void changeIndex(int index) async {
    _selectedIndex.value = index;
  }

  void changeMicState() {
    _isEnableGreyBarrier.value = !_isEnableGreyBarrier.value;
  }

  Future<void> initializeOrNoneUsers() async {
    await _userRepository.load();
  }

  Future<void> loadAndSaveSteps() async {
    // 금일 날짜의 00:00:00 ~ 23:59:59 사이의 걸음 수를 가져옴
    DateTime startAt =
        DateTime(_currentDate.year, _currentDate.month, _currentDate.day);
    DateTime endAt = DateTime(
        _currentDate.year, _currentDate.month, _currentDate.day, 23, 59, 59);
    double currentChangeCapacity =
        (await HealthUtil.getSteps(startAt, endAt)) * 0.000125;

    ActionHistoryData? data =
        await _actionHistoryRepository.readOneByTypeAndDateRange(
      EAction.steps,
      startAt,
      endAt,
    );

    // 증가되는 이산화탄소량을 계산함
    double increasedCO2 = currentChangeCapacity -
        (data != null ? data.changeCapacity.abs() : 0.0);

    // 금일 날짜의 00:00:00 ~ 23:59:59 사이의 걸음 수를 저장하는데
    // 저장된 걸음 수가 없다면 새로운 데이터를 생성하고
    // 저장된 걸음 수가 있다면 새로운 데이터를 생성하지 않고 업데이트함
    // 이후 사용자의 총 이산화탄소를 변화시킴
    if (data == null) {
      data = await _actionHistoryRepository.createOrUpdate(
        ActionHistoryCompanion.insert(
          changeCapacity: -currentChangeCapacity,
          createdAt: _currentDate,
          updatedAt: _currentDate,
          type: EAction.steps,
        ),
      );

      Get.find<HomeViewModel>().setReducedCO2(
          await _userRepository.increaseTotalCarbonDiOxide(increasedCO2));
    } else if (data.changeCapacity.abs() < currentChangeCapacity) {
      data = await _actionHistoryRepository.createOrUpdate(
        data
            .copyWith(
              changeCapacity: -currentChangeCapacity,
              updatedAt: _currentDate,
            )
            .toCompanion(true),
      );

      Get.find<HomeViewModel>().setReducedCO2(
          await _userRepository.increaseTotalCarbonDiOxide(increasedCO2));
    }
  }
}
