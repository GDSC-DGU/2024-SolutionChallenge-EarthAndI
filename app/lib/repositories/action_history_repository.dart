import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/models/profile/action_history_state.dart';
import 'package:earth_and_i/models/profile/daily_delta_co2_state.dart';
import 'package:earth_and_i/providers/action/action_history_local_provider.dart';
import 'package:earth_and_i/providers/notification/notification_provider.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:get/get.dart';

class ActionHistoryRepository extends GetxService {
  late final ActionHistoryLocalProvider _localProvider;
  late final NotificationProvider _notificationProvider;

  // 00 ~ 06 -> _actionGroups[0]
  // 06 ~ 12 -> _actionGroups[1]
  // 12 ~ 18 -> _actionGroups[2]
  // 18 ~ 24 -> _actionGroups[3]
  static final List<List<EAction>> _actionGroups = [
    [],
    [
      EAction.meal,
      EAction.publicTransportation,
      EAction.sns,
    ],
    [
      EAction.meal,
      EAction.tumbler,
      EAction.stairs,
      EAction.recycle,
    ],
    [
      EAction.optimalTemperature,
      EAction.meal,
      EAction.sns,
      EAction.waterUsage,
      EAction.standbyPower,
    ],
  ];

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalDatabaseFactory.instance.actionHistoryDao;
    _notificationProvider = Get.find<NotificationProvider>();
  }

  /* ----------------------------------------------------- */
  /* ----------------------- State ----------------------- */
  /* ----------------------------------------------------- */
  Future<List<CarbonCloudState>> readCarbonCloudStates(
    DateTime currentAt,
  ) async {
    int groupIndex = currentAt.hour ~/ 6;
    List<EAction> actions = _actionGroups[groupIndex];

    if (groupIndex == 0) {
      return [];
    }

    // 현재 시간에 해당하는 시간 범위를 구한다.
    DateTime startAt = DateTime(currentAt.year, currentAt.month, currentAt.day,
        0 + 6 * groupIndex, 0, 0);
    DateTime endAt = DateTime(currentAt.year, currentAt.month, currentAt.day,
        5 + 6 * groupIndex, 59, 59);

    // 위에서 구한 값을 기반으로 액션 히스토리를 가져온다.
    List<ActionHistoryData> histories =
        await _localProvider.findAllByTypesAndDateRange(
      actions,
      startAt,
      endAt,
    );

    // actions와 histories를 비교하여, 해당 시간에 해당하는 액션을 수행했는지 확인한다.
    // 수행했다면, 해당 액션의 타입이 없을 때, CarbonCloudState로 변환하여 반환한다.
    int index = 0;
    List<CarbonCloudState> states = [];
    for (var action in actions) {
      if (histories.indexWhere((element) => element.type == action) == -1) {
        // groupIndex에 따라서 dawn, morning, afternoon, evening을 설정한다.
        states.add(CarbonCloudState(
          action: action,
          groupIndex: groupIndex,
          isLeftPos: index.isEven,
        ));

        index++;
      }
    }

    return states;
  }

  Future<DailyDeltaCO2State> readDailyDeltaCO2State(DateTime currentAt) async {
    DateTime startAt = DateTime(currentAt.year, currentAt.month, currentAt.day);
    DateTime endAt =
        DateTime(currentAt.year, currentAt.month, currentAt.day, 23, 59, 59);

    List<ActionHistoryData> histories =
        await _localProvider.findAllByDateRangeAndOffset(
      startAt,
      endAt,
      -1,
      -1,
    );

    // Brief Delta CO2
    double positiveDeltaCO2 = 0;
    double negativeDeltaCO2 = 0;

    // Detail Delta CO2
    double healthPositiveDeltaCO2 = 0;
    double healthNegativeDeltaCO2 = 0;
    double mentalPositiveDeltaCO2 = 0;
    double mentalNegativeDeltaCO2 = 0;
    double cashPositiveDeltaCO2 = 0;
    double cashNegativeDeltaCO2 = 0;

    for (var history in histories) {
      if (history.changeCapacity > 0) {
        negativeDeltaCO2 += history.changeCapacity;
      } else {
        positiveDeltaCO2 += history.changeCapacity;
      }

      switch (history.userStatus) {
        case EUserStatus.health:
          if (history.changeCapacity < 0) {
            healthPositiveDeltaCO2 += history.changeCapacity;
          } else {
            healthNegativeDeltaCO2 += history.changeCapacity;
          }
          break;
        case EUserStatus.mental:
          if (history.changeCapacity < 0) {
            mentalPositiveDeltaCO2 += history.changeCapacity;
          } else {
            mentalNegativeDeltaCO2 += history.changeCapacity;
          }
          break;
        case EUserStatus.cash:
          if (history.changeCapacity < 0) {
            cashPositiveDeltaCO2 += history.changeCapacity;
          } else {
            cashNegativeDeltaCO2 += history.changeCapacity;
          }
          break;
        default:
          break;
      }
    }

    DailyDeltaCO2State currentState = DailyDeltaCO2State(
      positiveDeltaCO2: positiveDeltaCO2,
      negativeDeltaCO2: negativeDeltaCO2,
      healthPositiveDeltaCO2: healthPositiveDeltaCO2,
      healthNegativeDeltaCO2: healthNegativeDeltaCO2,
      mentalPositiveDeltaCO2: mentalPositiveDeltaCO2,
      mentalNegativeDeltaCO2: mentalNegativeDeltaCO2,
      cashPositiveDeltaCO2: cashPositiveDeltaCO2,
      cashNegativeDeltaCO2: cashNegativeDeltaCO2,
    );

    return currentState;
  }

  Future<List<ActionHistoryState>> readActionHistoryStates(
    DateTime currentAt,
    int page,
    int size,
  ) async {
    DateTime startAt = DateTime(currentAt.year, currentAt.month, currentAt.day);
    DateTime endAt =
        DateTime(currentAt.year, currentAt.month, currentAt.day, 23, 59, 59);

    List<ActionHistoryData> histories =
        await _localProvider.findAllByDateRangeAndOffset(
      startAt,
      endAt,
      page,
      size,
    );

    List<ActionHistoryState> states =
        histories.map((e) => ActionHistoryState.fromData(e)).toList();

    // histories에서 EAction.steps를 맨 앞으로 보내고, 없다면 새로운 값을 추가해준다.
    if (states.indexWhere((element) => element.type == EAction.steps) == -1) {
      states.insert(
        0,
        ActionHistoryState(
          characterStatus: '',
          createdAt: DateTime.now(),
          changeCapacity: 0,
          type: EAction.steps,
          question: '',
          answer: '0',
        ),
      );
    } else {
      ActionHistoryState steps = states.removeAt(
        states.indexWhere((element) => element.type == EAction.steps),
      );

      states.insert(0, steps);
    }

    return states;
  }

  /* ----------------------------------------------------- */
  /* ---------------------- DataBase --------------------- */
  /* ----------------------------------------------------- */
  Future<void> createOrUpdate(ActionHistoryCompanion data) async {
    try {
      await _localProvider.save(data);
    } on Exception catch (e) {
      LogUtil.e(e);
      rethrow;
    }

    DateTime currentAt = data.updatedAt.value;
    int groupIndex = currentAt.hour ~/ 6;
    List<EAction> actions = _actionGroups[groupIndex];

    if (groupIndex == 0) {
      return;
    }

    // 현재 시간에 해당하는 시간 범위를 구한다.
    DateTime startAt = DateTime(currentAt.year, currentAt.month, currentAt.day,
        0 + 6 * groupIndex, 0, 0);
    DateTime endAt = DateTime(currentAt.year, currentAt.month, currentAt.day,
        5 + 6 * groupIndex, 59, 59);

    // 위에서 구한 값을 기반으로 액션 히스토리를 가져온다.
    List<ActionHistoryData> histories =
        await _localProvider.findAllByTypesAndDateRange(
      actions,
      startAt,
      endAt,
    );

    if (histories.length == actions.length) {
      await _notificationProvider.postActionHistoryLogs(histories);
    }
  }

  Future<ActionHistoryData?> readOneByTypeAndDateRange(
    EAction type,
    DateTime startAt,
    DateTime endAt,
  ) async {
    try {
      return await _localProvider.findByTypeAndDateRange(type, startAt, endAt);
    } on Exception catch (e) {
      LogUtil.e(e);
      rethrow;
    }
  }
}
