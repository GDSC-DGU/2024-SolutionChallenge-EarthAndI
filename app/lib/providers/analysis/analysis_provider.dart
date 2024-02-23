import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

abstract class AnalysisProvider {
  Future<Map<String, dynamic>> postAnalysisText(
    EUserStatus userStatus,
    String question,
    String answer,
  );

  Future<Map<String, dynamic>> postAnalysisImage(
    EChallenge challenge,
    String image,
  );
}
