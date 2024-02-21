import 'package:earth_and_i/domains/type/e_challenge.dart';

abstract class ChallengeAuthenticationProvider {
  Future<Map<String, dynamic>> postChallengeAction(
    EChallenge challenge,
    String image,
  );
}
