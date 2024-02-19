import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/providers/challenge_authentication_provider.dart';
import 'package:get/get.dart';

class ChallengeAuthenticationRepository extends GetxService {
  late final ChallengeAuthenticationProvider _challengeAuthenticationProvider;

  @override
  void onInit() {
    super.onInit();
    _challengeAuthenticationProvider =
        Get.find<ChallengeAuthenticationProvider>();
  }

  Future<Map<String, dynamic>> challengeAuthAction(
    EChallenge challenge,
    String image,
  ) async {
    Map<String, dynamic> result;

    try {
      result = await _challengeAuthenticationProvider.postChallengeAction(
        challenge,
        image,
      );
    } catch (e) {
      rethrow;
    }

    return {
      "type": result["type"],
      "res": result["res"],
    };
  }
}
