import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/providers/challenge_authentication/challenge_authentication_connect.dart';
import 'package:earth_and_i/providers/challenge_authentication_provider.dart';
import 'package:get/get.dart';

class ChallengeAuthenticationProviderImpl extends ChallengeAuthenticationConnect
    implements ChallengeAuthenticationProvider {
  @override
  Future<Map<String, dynamic>> postChallengeAction(
    EChallenge challenge,
    String image,
  ) async {
    final Response response;

    try {
      response = await post(
        "",
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
