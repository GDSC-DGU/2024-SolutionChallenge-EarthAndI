import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

abstract class AnalysisRepository {
  Future<Map<String, dynamic>> analysisAction(
    EUserStatus userStatus,
    String question,
    String answer,
  );

  Future<Map<String, dynamic>> analysisChallenge(
    EChallenge challenge,
    String image,
  );
}
