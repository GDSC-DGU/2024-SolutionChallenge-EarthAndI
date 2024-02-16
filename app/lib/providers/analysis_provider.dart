import 'package:earth_and_i/domains/type/e_user_status.dart';

abstract class AnalysisProvider {
  Future<Map<String, dynamic>> postAnalysisAction(
    EUserStatus userStatus,
    String question,
    String answer,
  );
}
