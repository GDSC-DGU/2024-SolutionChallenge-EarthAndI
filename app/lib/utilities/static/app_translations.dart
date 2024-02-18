import 'package:earth_and_i/utilities/static/character_translations.dart';
import 'package:earth_and_i/utilities/static/e_action_translations.dart';
import 'package:earth_and_i/utilities/static/e_challenge_translations.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': korean,
        'en_US': english,
      };

  static Map<String, String> get korean => {
        ...CharacterTranslations.kr,
        ...EActionTranslations.kr,
        ...EChallengeTranslations.kr,
        // Home Screen
        "analysis_snackBar_title": "분석 중",
        "analysis_snackBar_content": "분석 중에는 탄소 구름을 터치할 수 없습니다.",
        "start_speech_recognize": "음성 인식을 시작해주세요!",

        // Sign In Dialog
        "sign_in_required": "로그인이 필요한 서비스입니다.\n로그인 하시겠어요?",
        "confirm": "확인",
        "cancel": "취소",

        // Sign In Screen
        "sign_in": "로그인",
        "sign_in_conditions": "Earth & I는 사용자의 활동을 기록하고, 환경에 대한 정보를 제공합니다.",
        "sign_in_btn": "동의 및 구글로그인",
        "sign_in_success": "로그인 성공",
        "sign_in_success_long": "서비스를 이용할 수 있습니다.",
        "sign_in_failed": "로그인 실패",
        "sign_in_failed_long": "잠시 후 다시 시도해주세요.",
      };

  static Map<String, String> get english => {
        ...CharacterTranslations.en,
        ...EActionTranslations.en,
        ...EChallengeTranslations.en,
        // Home Screen
        "analysis_snackBar_title": "Analyzing",
        "analysis_snackBar_content":
            "You cannot touch the carbon cloud while analyzing.",
        "start_speech_recognize": "Please start\nspeech recognition!",

        // Sign In Dialog
        "sign_in_required":
            "This service requires login.\nWould you like to log in?",
        "cancel": "Cancel",
        "confirm": "Confirm",

        // Sign In Screen
        "sign_in": "Login",
        "sign_in_conditions":
            "Earth & I records user activities and provides information about the environment.",
        "sign_in_btn": "Agree and Sign in with Google",
        "sign_in_success": "Login success",
        "sign_in_success_long": "You can use the service.",
        "sign_in_failed": "Login failed",
        "sign_in_failed_long": "Please try again later.",
      };
}
