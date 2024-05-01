import 'package:earth_and_i/utilities/translation/character_translations.dart';
import 'package:earth_and_i/utilities/translation/common_translations.dart';
import 'package:earth_and_i/utilities/translation/e_action_translations.dart';
import 'package:earth_and_i/utilities/translation/e_challenge_translations.dart';
import 'package:earth_and_i/utilities/translation/language_translations.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': korean,
        'en_UK': english,
      };

  static Map<String, String> get korean => {
        ...CommonTranslations.kr,
        ...CharacterTranslations.kr,
        ...LanguageTranslations.kr,
        ...EActionTranslations.kr,
        ...EChallengeTranslations.kr,

        // Load Map Screen
        "hint_text_0": "찬물 세탁도 지구를 지킬 수 있답니다!",
        "hint_text_1": "불필요한 이메일을 지우면 지구를 지킬 수 있어요!",
        "hint_text_2": "종이컵 대신 개인용 텀블러를 사용해보세요!",
        "current_challenge": "진행중인 챌린지",
        "completed_challenge": "완료한 챌린지",
        'clear_all_challenge_short_title': '모든 챌린지 클리어!',
        'clear_all_challenge_long_title': '모든 챌린지를 클리어했어요!',
        'clear_all_challenge_description': '모든 챌린지를 클리어했어요!\n 다음 챌린지를 기다려주세요!',
        "coming_soon_challenge_banner": "챌린지를 확인하고, 실천해봐요!",

        // Home Screen
        "time_exception_title": "새로운 구름을 확인해주세요",
        "time_exception_content": "시간이 오래되어 탄소 구름들이 사라졌어요!!",
        "analysis_snackBar_title": "분석 중",
        "analysis_snackBar_content": "분석 중에는 탄소 구름을 터치할 수 없습니다.",
        "start_speech_recognize": "음성 인식을 시작해주세요!",

        // profile Screen
        "total_Delta_CO2": "탄소량 총합",
        "emission_CO2": "배출한 탄소량",
        "economize_CO2": "절약한 탄소량",

        // Challenge Authentication Screen
        "challenge_authentication_title": "챌린지 인증하기",
        "image_picker_btn": "사진 선택하기",
        "authentication_btn": "인증하기",
        "loading_analysis_image": "제출한 사진을 AI가 분석중이에요",
        "success_challenge": "챌린지 달성 완료!\n새로운 챌린지를 확인해보세요.",
        "failed_challenge": "제출한 사진이 잘못된 것 같아요!",

        // user search screen
        "user_search": "유저 검색",
        "search_hint": "유저 이름을 입력해주세요",
        "search_btn": "검색",

        // Sign In Screen
        "sign_in_conditions": "Earth & I는 사용자의 활동을 기록하고, 환경에 대한 정보를 제공합니다.",
        "sign_in_btn": "동의 및 구글로그인",

        // Setting Screen
        "setting": "설정",
        "notification_active": "알림 활성화",
        "notification_time": "알림 시간",

        // Coming Soon Challenge Screen
        "coming_soon_challenge": "커밍순 챌린지",
        "coming_soon_challenge_description_1": "새로운 챌린지를 확인하고",
        "coming_soon_challenge_description_2": "함께 실천해 나가요!",

        // Ranking Screen
        "honorific": "님의",
        "party": "파티",
        "party_rank": "파티 순위",
        "not_register_friend": "등록된 친구가 없습니다.",
        "recommend_sharing": "친구들에게 E&I를 공유해보세요!!",
        "not_send_myself": "자신에게는 보낼 수 없어요.",
        "not_send_myself_detail": "친구들에게 보내주세요.",
        "sending_message": "메시지 전송 중",
        "sending_message_detail": "잠시만 기다려주세요.",
        "send_message_success": "메시지를 전송했어요!",
        "send_message_success_detail": "앞으로 1시간동안 해당 친구에게 메시지를 보낼 수 없어요.",
        "send_message_fail": "메시지 전송에 실패했어요!",
        "send_message_fail_detail": "1시간 내에 메세지를 보내지 않았다면 다시 시도해주세요.",
      };

  static Map<String, String> get english => {
        ...CommonTranslations.en,
        ...CharacterTranslations.en,
        ...LanguageTranslations.en,
        ...EActionTranslations.en,
        ...EChallengeTranslations.en,

        // Load Map Screen
        "hint_text_0": "Washing with cold water\ncan save the earth!",
        "hint_text_1": "Deleting unnecessary emails\ncan save the earth!",
        "hint_text_2": "Try using a personal tumbler\ninstead of a paper cup!",
        "current_challenge": "Current Challenge",
        "completed_challenge": "Completed Challenge",
        'clear_all_challenge_short_title': 'Clear All Challenge',
        'clear_all_challenge_long_title': 'You have cleared all challenges!',
        'clear_all_challenge_description':
            'You have cleared all challenges! Please wait for the next challenge!',
        "coming_soon_challenge_banner": "Check Challenges and Practice them!",

        // Home Screen
        "time_exception_title": "Please check the new clouds",
        "time_exception_content":
            "The carbon clouds have disappeared due to the long time.",
        "analysis_snackBar_title": "Analyzing",
        "analysis_snackBar_content":
            "You cannot touch the carbon cloud while analyzing.",
        "start_speech_recognize": "Please start\nspeech recognition!",

        // profile Screen
        "total_Delta_CO2": "Total CO2",
        "emission_CO2": "   Emission CO2",
        "economize_CO2": "Economize CO2",

        // Challenge Authentication Screen
        "challenge_authentication_title": "Challenge Authentication",
        "image_picker_btn": "Select Image",
        "authentication_btn": "Authentication",
        "loading_analysis_image": "AI is analyzing the submitted image",
        "success_challenge":
            "Challenge achievement complete!\nCheck out the new challenge.",
        "failed_challenge": "The submitted photo\nseems to be wrong!",

        // Sign In Screen
        "sign_in_conditions":
            "Earth & I records user activities and provides information about the environment.",
        "sign_in_btn": "Agree and Sign in with Google",

        // Setting Screen
        "setting": "Setting",
        "notification_active": "Notification Active",
        "notification_time": "Notification Time",

        // Coming Soon Challenge Screen
        "coming_soon_challenge": "Coming Soon Challenge",
        "coming_soon_challenge_description_1": "Check out the new challenges",
        "coming_soon_challenge_description_2": "and practice together!",

        // Ranking Screen
        "honorific": "'s",
        "party": "Party",
        "party_rank": "Party Rank",
        "not_register_friend": "There are no registered friends.",
        "recommend_sharing": "Share E&I with your friends!!",
        "not_send_myself": "You can't send it to yourself.",
        "not_send_myself_detail": "Please send it to your friends.",
        "sending_message": "Sending message",
        "sending_message_detail": "Please wait a moment.",
        "send_message_success": "Message sent!",
        "send_message_success_detail":
            "You can't send messages to that friend for the next hour.",
        "send_message_fail": "Failed to send message!",
        "send_message_fail_detail":
            "If you don't send a message within an hour, please try again.",
      };
}
