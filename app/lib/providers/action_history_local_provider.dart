import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';

abstract class ActionHistoryLocalProvider {
  Future<ActionHistoryData> save(ActionHistoryCompanion data);

  Future<ActionHistoryData?> findOneByTypeAndDateRange(
      EAction type, DateTime startAt, DateTime endAt);
}
