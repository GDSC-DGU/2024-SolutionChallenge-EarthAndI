import 'package:earth_and_i/utilities/static/character_translations.dart';
import 'package:earth_and_i/utilities/static/e_action_translations.dart';
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
        "start_speech_recognize": "음성 인식을 시작해주세요!"
      };

  static Map<String, String> get english => {
        ...CharacterTranslations.en,
        ...EActionTranslations.en,
        "start_speech_recognize": "Please start\nspeech recognition!"
      };
}
