import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/providers/analysis_provider.dart';
import 'package:earth_and_i/providers/base/base_connect.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';

class AnalysisProviderImpl extends BaseConnect implements AnalysisProvider {
  @override
  Future<Map<String, dynamic>> postAnalysisAction(
    EUserStatus userStatus,
    String question,
    String answer,
  ) async {
    final Response response;

    DevOnLog.i(answer);

    try {
      response = await post(
        "",
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
}
