import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/providers/action_history_local_provider.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';

class ActionHistoryRepository extends GetxService {
  late final ActionHistoryLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalDatabaseFactory.instance.actionHistoryDao;
  }

  Future<ActionHistoryData> createOrUpdate(ActionHistoryCompanion data) async {
    try {
      return await _localProvider.save(data);
    } on Exception catch (e) {
      DevOnLog.e(e);
      rethrow;
    }
  }

  Future<ActionHistoryData?> readOneByTypeAndDateRange(
    EAction type,
    DateTime startAt,
    DateTime endAt,
  ) async {
    try {
      return await _localProvider.findOneByTypeAndDateRange(
          type, startAt, endAt);
    } on Exception catch (e) {
      DevOnLog.e(e);
      rethrow;
    }
  }
}
