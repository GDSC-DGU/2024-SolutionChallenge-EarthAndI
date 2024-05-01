import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/models/profile/action_history_state.dart';
import 'package:earth_and_i/models/profile/daily_delta_co2_state.dart';

abstract class ActionHistoryRepository {
  /* ----------------------------------------------------- */
  /* ----------------------- State ----------------------- */
  /* ----------------------------------------------------- */
  Future<List<CarbonCloudState>> readCarbonCloudStates(DateTime currentAt);

  Future<DailyDeltaCO2State> readDailyDeltaCO2State(DateTime currentAt);

  Future<List<ActionHistoryState>> readActionHistoryStates(
    DateTime currentAt,
    int page,
    int size,
  );

  /* ----------------------------------------------------- */
  /* ---------------------- DataBase --------------------- */
  /* ----------------------------------------------------- */
  Future<void> createOrUpdate(ActionHistoryCompanion data);

  Future<ActionHistoryData?> readOneByTypeAndDateRange(
    EAction type,
    DateTime startAt,
    DateTime endAt,
  );

  Future<void> deleteAllActionHistories();
}
