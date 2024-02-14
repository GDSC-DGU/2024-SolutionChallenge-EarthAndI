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
      };

  static Map<String, String> get english => {
        ...CharacterTranslations.en,
        ...EActionTranslations.en,
      };
}
