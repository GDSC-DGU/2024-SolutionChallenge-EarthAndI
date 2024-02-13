import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/providers/analysis_provider.dart';
import 'package:get/get.dart';

class AnalysisRepository extends GetxService {
  late final AnalysisProvider _analysisProvider;

  @override
  void onInit() {
    super.onInit();
    _analysisProvider = Get.find<AnalysisProvider>();
  }

  Future<Map<String, dynamic>> analysisAction(
    EUserStatus userStatus,
    String speechText,
  ) async {
    Map<String, dynamic> result =
        await _analysisProvider.analysisSpeechText(userStatus, speechText);

    return {
      "answer": result["answer"],
      "changeCapacity": result["carbon"]["reduce"] == "good"
          ? -result["carbon"]["output"]
          : result["carbon"]["output"],
    };
  }
}
