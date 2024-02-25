import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/providers/analysis/analysis_provider.dart';
import 'package:earth_and_i/providers/base/base_connect.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AnalysisProviderImpl extends BaseConnect implements AnalysisProvider {
  @override
  String get hostUrl => dotenv.env['API_SERVER_HOST']!;

  @override
  Future<Map<String, dynamic>> postAnalysisText(
    EUserStatus userStatus,
    String question,
    String answer,
  ) async {
    final Response response;

    try {
      response = await post(
        "/api-1",
        {
          "input_text": {
            "type": userStatus.toString(),
            "question": question,
            "answer": answer,
          }
        },
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> postAnalysisImage(
    EChallenge challenge,
    String image,
  ) async {
    final Response response;

    try {
      LogUtil.d(challenge.index + 1);
      response = await post(
        "/api-2",
        {
          "input_data": {
            "type": (challenge.index + 1).toString(),
            "image": image,
          }
        },
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
