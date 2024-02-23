abstract class CommonTranslations {
  static Map<String, String> get kr => {
        // Common
        "sign_in": "로그인",
        "sign_out": "로그아웃",
        "confirm": "확인",
        "cancel": "취소",
        "next": "다음",
        "start": "시작",
        "health": "건강",
        "mental": "멘탈",
        "cash": "돈",

        // Notification
        "local_notification_content": "오늘은 어떤 변화가 있을까요?",

        // Exception
        "server_communication_failed_character":
            "서버와의 통신이 원활하지 않아!\n조금 뒤 다시 시도해줘!",
        "server_communication_failed": "서버 통신에 실패했어요.\n잠시 후 다시 시도해주세요.",

        // Sign In Dialog
        "sign_in_required": "로그인이 필요한 서비스입니다.\n로그인 하시겠어요?",
        "sign_in_success": "로그인 성공",
        "sign_in_success_long": "AI 서비스를 이용할 수 있습니다.",
        "sign_in_failed": "로그인 실패",
        "sign_in_failed_long": "잠시 후 다시 시도해주세요.",

        // Sign Out Dialog
        "sign_out_required": "로그아웃 하시겠어요?",
        "sign_out_success": "로그아웃 성공",
        "sign_out_success_long": "AI 서비스를 이용할 수 없습니다.",
        "sign_out_failed": "로그아웃 실패",
        "sign_out_failed_long": "잠시 후 다시 시도해주세요.",
      };

  static Map<String, String> get en => {
        // Common
        "sign_in": "Login",
        "sign_out": "Logout",
        "cancel": "Cancel",
        "confirm": "Confirm",
        "next": "Next",
        "start": "Start",
        "health": "Health",
        "mental": "Mental",
        "cash": "Cash",

        // Notification
        "local_notification_content": "What changes will happen today?",

        // Exception

        "server_communication_failed_character":
            "Server communication failed.\nPlease try again later.",
        "server_communication_failed":
            "Server communication failed.\nPlease try again later.",

        // Sign In Dialog
        "sign_in_required":
            "This service requires login.\nWould you like to log in?",
        "sign_in_success": "Login success",
        "sign_in_success_long": "You can use the AI service.",
        "sign_in_failed": "Login failed",
        "sign_in_failed_long": "Please try again later.",

        // Sign Out Dialog
        "sign_out_required": "Would you like to log out?",
        "sign_out_success": "Logout success",
        "sign_out_success_long": "You cannot use the AI service.",
        "sign_out_failed": "Logout failed",
        "sign_out_failed_long": "Please try again later.",
      };
}
