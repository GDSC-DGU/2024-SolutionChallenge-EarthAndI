abstract class EActionTranslations {
  /* ----------------------------------------------------- */
  /* -------------------- EAction.all -------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get kr => {
        ...krSteps,
        ...krStairs,
        ...krMeal,
        ...krData,
        ...krSns,
        ...krRecycle,
        ...krStandbyPower,
        ...krWaterUsage,
        ...krOptimalTemperature,
        ...krTumbler,
        ...krPublicTransportation,
      };

  static Map<String, String> get en => {
        ...enSteps,
        ...enStairs,
        ...enMeal,
        ...enData,
        ...enSns,
        ...enRecycle,
        ...enStandbyPower,
        ...enWaterUsage,
        ...enOptimalTemperature,
        ...enTumbler,
        ...enPublicTransportation,
      };

  /* ----------------------------------------------------- */
  /* ------------------- EAction.steps ------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krSteps => {
        // 행위 이름
        'steps': '걷기',
        'steps_example_answer': '건강에도 좋은 걷기',

        // dawn
        'steps_dawn_short': 'none',
        'steps_dawn_long': 'none',
        'steps_dawn_example_answer': 'none',

        // morning
        'steps_morning_short': 'none',
        'steps_morning_long': 'none',
        'steps_morning_example_answer': 'none',

        // afternoon
        'steps_afternoon_short': 'none',
        'steps_afternoon_long': 'none',
        'steps_afternoon_example_answer': 'none',

        // evening
        'steps_evening_short': 'none',
        'steps_evening_long': 'none',
        'steps_evening_example_answer': 'none',
      };

  static Map<String, String> get enSteps => {
        // 행위 이름
        'steps': 'Walking',
        'steps_example_answer': 'Walking is good for your health',

        // dawn
        'steps_dawn_short': 'none',
        'steps_dawn_long': 'none',
        'steps_dawn_example_answer': 'none',

        // morning
        'steps_morning_short': 'none',
        'steps_morning_long': 'none',
        'steps_morning_example_answer': 'none',

        // afternoon
        'steps_afternoon_short': 'none',
        'steps_afternoon_long': 'none',
        'steps_afternoon_example_answer': 'none',

        // evening
        'steps_evening_short': 'none',
        'steps_evening_long': 'none',
        'steps_evening_example_answer': 'none',
      };

  /* ----------------------------------------------------- */
  /* ------------------- EAction.stairs ------------------ */
  /* ----------------------------------------------------- */
  static Map<String, String> get krStairs => {
        // 행위 이름
        'stairs': '계단 이용하기',
        'stairs_example_answer': '계단 이용했지 또는 안 이용했지',

        // dawn
        'stair_dawn_short': 'none',
        'stair_dawn_long': 'none',
        'stair_dawn_example_answer': 'none',

        // morning
        'stair_morning_short': 'none',
        'stair_morning_long': 'none',
        'stair_morning_example_answer': 'none',

        // afternoon
        'stair_afternoon_short': '계단으로 이동하는거 어때?',
        'stair_afternoon_long': '에스컬레이터나 엘리베이터 보다는 되도록\n계단을 이용해보자!',
        'stair_afternoon_example_answer': '계단 이용했지 또는 안 이용했지',

        // evening
        'stair_evening_short': 'none',
        'stair_evening_long': 'none',
        'stair_evening_example_answer': 'none',
      };

  static Map<String, String> get enStairs => {
        // 행위 이름
        'stairs': 'Use Stairs',
        'stairs_example_answer': 'Used stairs or not',

        // dawn
        'stair_dawn_short': 'none',
        'stair_dawn_long': 'none',
        'stair_dawn_example_answer': 'none',

        // morning
        'stair_morning_short': 'none',
        'stair_morning_long': 'none',
        'stair_morning_example_answer': 'none',

        // afternoon
        'stair_afternoon_short': 'How about moving by stairs?',
        'stair_afternoon_long':
            'Let\'s try to use the stairs rather\nthan the escalator or elevator!',
        'stair_afternoon_example_answer': 'Used stairs or not',

        // evening
        'stair_evening_short': 'none',
        'stair_evening_long': 'none',
        'stair_evening_example_answer': 'none',
      };

  /* ----------------------------------------------------- */
  /* ------------------- EAction.meal ------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krMeal => {
        // 행위 이름
        'meal': '채식하기',
        'meal_example_answer': '자유롭게 답변해주세요',

        // dawn
        'meal_dawn_short': 'none',
        'meal_dawn_long': 'none',
        'meal_dawn_example_answer': 'none',

        // morning
        'meal_morning_short': '아침은?',
        'meal_morning_long': '오늘 아침으로 뭐 먹었어?',
        'meal_morning_example_answer': '자유롭게 답변해주세요',

        // afternoon
        'meal_afternoon_short': '점심은?',
        'meal_afternoon_long': '점심은 맛있는거 먹었어?',
        'meal_afternoon_example_answer': '자유롭게 답변해주세요',

        // evening
        'meal_evening_short': '저녁은?',
        'meal_evening_long': '저녁으로 뭐 먹었어?',
        'meal_evening_example_answer': '자유롭게 답변해주세요',
      };

  static Map<String, String> get enMeal => {
        // 행위 이름
        'meal': 'Vegetarian Diet',
        'meal_example_answer': 'Please answer freely',

        // dawn
        'meal_dawn_short': 'none',
        'meal_dawn_long': 'none',
        'meal_dawn_example_answer': 'none',

        // morning
        'meal_morning_short': 'What about breakfast?',
        'meal_morning_long': 'What did you eat\nfor breakfast today?',
        'meal_morning_example_answer': 'Please answer freely',

        // afternoon
        'meal_afternoon_short': 'What about lunch?',
        'meal_afternoon_long': 'Did you eat something\ndelicious for lunch?',
        'meal_afternoon_example_answer': 'Please answer freely',

        // evening
        'meal_evening_short': 'What about dinner?',
        'meal_evening_long': 'What did you eat\nfor dinner?',
        'meal_evening_example_answer': 'Please answer freely',
      };

  /* ----------------------------------------------------- */
  /* ------------------- EAction.data -------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krData => {
        "data": "데이터 사용량 줄이기",
        "data_example_answer": "자유롭게 답변해주세요",

        // dawn
        'data_dawn_short': 'none',
        'data_dawn_long': 'none',
        'data_dawn_example_answer': 'none',

        // morning
        'data_morning_short': 'none',
        'data_morning_long': 'none',
        'data_morning_example_answer': 'none',

        // afternoon
        'data_afternoon_short': 'none',
        'data_afternoon_long': 'none',
        'data_afternoon_example_answer': 'none',

        // evening
        'data_evening_short': 'none',
        'data_evening_long': 'none',
        'data_evening_example_answer': 'none',
      };

  static Map<String, String> get enData => {
        "data": "Reduce Data Usage",
        "data_example_answer": "Please answer freely",

        // dawn
        'data_dawn_short': 'none',
        'data_dawn_long': 'none',
        'data_dawn_example_answer': 'none',

        // morning
        'data_morning_short': 'none',
        'data_morning_long': 'none',
        'data_morning_example_answer': 'none',

        // afternoon
        'data_afternoon_short': 'none',
        'data_afternoon_long': 'none',
        'data_afternoon_example_answer': 'none',

        // evening
        'data_evening_short': 'none',
        'data_evening_long': 'none',
        'data_evening_example_answer': 'none',
      };

  /* ----------------------------------------------------- */
  /* ------------------- EAction.sns --------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krSns => {
        // 행위 이름
        'sns': 'SNS 줄이기',
        'sns_example_answer': '사용했지 또는 사용하지 않았지',

        // dawn
        'sns_dawn_short': 'none',
        'sns_dawn_long': 'none',
        'sns_dawn_example_answer': 'none',

        // morning
        'sns_morning_short': '누워서 스마트폰하는거 아니지?',
        'sns_morning_long': '아침부터 너무 많은 데이터를 사용하는거 아니지?',
        'sns_morning_example_answer': '사용했지 또는 사용하지 않았지',

        // afternoon
        'sns_afternoon_short': 'none',
        'sns_afternoon_long': 'none',
        'sns_afternoon_example_answer': 'none',

        // evening
        'sns_evening_short': '도파밍 No!',
        'sns_evening_long': '자기 전에 너튜브, 인스타\n안 보고 잘꺼지?!',
        'sns_evening_example_answer': '안 볼껀데! 또는 볼꺼야',
      };

  static Map<String, String> get enSns => {
        // 행위 이름
        'sns': 'SNS',
        'sns_example_answer': 'Used or not',

        // dawn
        'sns_dawn_short': 'none',
        'sns_dawn_long': 'none',
        'sns_dawn_example_answer': 'none',

        // morning
        'sns_morning_short': 'Aren’t you using too much data from the morning?',
        'sns_morning_long': 'Aren’t you using too much data from the morning?',
        'sns_morning_example_answer': 'Used or not',

        // afternoon
        'sns_afternoon_short': 'none',
        'sns_afternoon_long': 'none',
        'sns_afternoon_example_answer': 'none',

        // evening
        'sns_evening_short': 'No dopamine!',
        'sns_evening_long':
            'Are you going to bed without watching YouTube or Instagram?',
        'sns_evening_example_answer': 'I won’t watch! or I will watch',
      };

  /* ----------------------------------------------------- */
  /* ----------------- EAction.recycle ------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krRecycle => {
        // 행위 이름
        'recycle': '재활용하기',
        'recycle_example_answer': '지켰지 또는 지키지 않았지',

        // dawn
        'recycle_dawn_short': 'none',
        'recycle_dawn_long': 'none',
        'recycle_dawn_example_answer': 'none',

        // morning
        'recycle_morning_short': 'none',
        'recycle_morning_long': 'none',
        'recycle_morning_example_answer': 'none',

        // afternoon
        'recycle_afternoon_short': '재활용 잘 지키고 있지?',
        'recycle_afternoon_long': '재활용 잘 지키고 있지?',
        'recycle_afternoon_example_answer': '지켰지 또는 지키지 않았지',

        // evening
        'recycle_evening_short': 'none',
        'recycle_evening_long': 'none',
        'recycle_evening_example_answer': 'none',
      };

  static Map<String, String> get enRecycle => {
        // 행위 이름
        'recycle': 'Recycle',
        // dawn
        'recycle_dawn_short': 'none',
        'recycle_dawn_long': 'none',
        'recycle_dawn_example_answer': 'none',

        // morning
        'recycle_morning_short': 'none',
        'recycle_morning_long': 'none',
        'recycle_morning_example_answer': 'none',

        // afternoon
        'recycle_afternoon_short': 'Are you recycling well?',
        'recycle_afternoon_long': 'Are you recycling well?',
        'recycle_afternoon_example_answer': 'Did you keep it or not',

        // evening
        'recycle_evening_short': 'none',
        'recycle_evening_long': 'none',
        'recycle_evening_example_answer': 'none',
      };

  /* ----------------------------------------------------- */
  /* --------------- EAction.standbyPower ---------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krStandbyPower => {
        // 행위 이름
        'standbyPower': '대기 전력 줄이기',
        'standbyPower_example_answer': '뽑았지 또는 안뽑았지',

        // dawn
        'standbyPower_dawn_short': 'none',
        'standbyPower_dawn_long': 'none',
        'standbyPower_dawn_example_answer': 'none',

        // morning
        'standbyPower_morning_short': 'none',
        'standbyPower_morning_long': 'none',
        'standbyPower_morning_example_answer': 'none',

        // afternoon
        'standbyPower_afternoon_short': 'none',
        'standbyPower_afternoon_long': 'none',
        'standbyPower_afternoon_example_answer': 'none',

        // evening
        'standbyPower_evening_short': '대기전력?',
        'standbyPower_evening_long': '오늘도 안쓰는 콘센트 뽑았지?',
        'standbyPower_evening_example_answer': '뽑았지 또는 안뽑았지',
      };

  static Map<String, String> get enStandbyPower => {
        // 행위 이름
        'standbyPower': 'Standby Power',
        // dawn
        'standbyPower_dawn_short': 'none',
        'standbyPower_dawn_long': 'none',
        'standbyPower_dawn_example_answer': 'none',

        // morning
        'standbyPower_morning_short': 'none',
        'standbyPower_morning_long': 'none',
        'standbyPower_morning_example_answer': 'none',

        // afternoon
        'standbyPower_afternoon_short': 'none',
        'standbyPower_afternoon_long': 'none',
        'standbyPower_afternoon_example_answer': 'none',

        // evening
        'standbyPower_evening_short': 'Standby Power?',
        'standbyPower_evening_long': 'Did you unplug\nthe unused outlet today?',
        'standbyPower_evening_example_answer': 'Did you unplug it or not',
      };

  /* ----------------------------------------------------- */
  /* --------------- EAction.waterUsage ------------------ */
  /* ----------------------------------------------------- */
  static Map<String, String> get krWaterUsage => {
        // 행위 이름
        'waterUsage': '물 사용량 줄이기',
        'waterUsage_example_answer': '자유롭게 답변해주세요',

        // dawn
        'waterUsage_dawn_short': 'none',
        'waterUsage_dawn_long': 'none',
        'waterUsage_dawn_example_answer': 'none',

        // morning
        'waterUsage_morning_short': 'none',
        'waterUsage_morning_long': 'none',
        'waterUsage_morning_example_answer': 'none',

        // afternoon
        'waterUsage_afternoon_short': 'none',
        'waterUsage_afternoon_long': 'none',
        'waterUsage_afternoon_example_answer': 'none',

        // evening
        'waterUsage_evening_short': '오늘 샤워는 얼마나 했어?',
        'waterUsage_evening_long': '물 FLEX 한거 아니지?',
        'waterUsage_evening_example_answer': '15분 했어!!',
      };

  static Map<String, String> get enWaterUsage => {
        // 행위 이름
        'waterUsage': 'Water Usage',
        'waterUsage_example_answer': 'Please answer freely',

        // dawn
        'waterUsage_dawn_short': 'none',
        'waterUsage_dawn_long': 'none',
        'waterUsage_dawn_example_answer': 'none',

        // morning
        'waterUsage_morning_short': 'none',
        'waterUsage_morning_long': 'none',
        'waterUsage_morning_example_answer': 'none',

        // afternoon
        'waterUsage_afternoon_short': 'none',
        'waterUsage_afternoon_long': 'none',
        'waterUsage_afternoon_example_answer': 'none',

        // evening
        'waterUsage_evening_short': 'How long did you shower today?',
        'waterUsage_evening_long': 'Did you flex on water?',
        'waterUsage_evening_example_answer': 'I showered for 15 minutes!!',
      };

  /* ----------------------------------------------------- */
  /* ------------ EAction.optimalTemperature ------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krOptimalTemperature => {
        // 행위 이름
        'optimalTemperature': '적정 온도 맞추기',
        'optimalTemperature_example_answer': '맞췄지 또는 안 맞췄지',

        // dawn
        'optimalTemperature_dawn_short': 'none',
        'optimalTemperature_dawn_long': 'none',
        'optimalTemperature_dawn_example_answer': 'none',

        // morning
        'optimalTemperature_morning_short': 'none',
        'optimalTemperature_morning_long': 'none',
        'optimalTemperature_morning_example_answer': 'none',

        // afternoon
        'optimalTemperature_afternoon_short': 'none',
        'optimalTemperature_afternoon_long': 'none',
        'optimalTemperature_afternoon_example_answer': 'none',

        // evening
        'optimalTemperature_evening_short': '적정온도?',
        'optimalTemperature_evening_long': '냉방은 26도, 난방은 20도\n맞추고 있지?',
        'optimalTemperature_evening_example_answer': '맞췄지 또는 안 맞췄지',
      };

  static Map<String, String> get enOptimalTemperature => {
        // 행위 이름
        'optimalTemperature': 'Optimal Temperature',
        'optimalTemperature_example_answer': 'Did you adjust it or not?',

        // dawn
        'optimalTemperature_dawn_short': 'none',
        'optimalTemperature_dawn_long': 'none',
        'optimalTemperature_dawn_example_answer': 'none',

        // morning
        'optimalTemperature_morning_short': 'none',
        'optimalTemperature_morning_long': 'none',
        'optimalTemperature_morning_example_answer': 'none',

        // afternoon
        'optimalTemperature_afternoon_short': 'none',
        'optimalTemperature_afternoon_long': 'none',
        'optimalTemperature_afternoon_example_answer': 'none',

        // evening
        'optimalTemperature_evening_short': 'Optimal temperature?',
        'optimalTemperature_evening_long':
            'Are you adjusting\nthe cooling to 26 degrees\nand the heating to 20 degrees?',
        'optimalTemperature_evening_example_answer':
            'Did you adjust it or not?',
      };

  /* ----------------------------------------------------- */
  /* ----------------- EAction.tumbler -------------------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krTumbler => {
        // 행위 이름
        'tumbler': '텀블러 사용하기',
        'tumbler_example_answer': '텀블러 썻지 또는 일회용품 썻지',

        // dawn
        'tumbler_dawn_short': 'none',
        'tumbler_dawn_long': 'none',
        'tumbler_dawn_example_answer': 'none',

        // morning
        'tumbler_morning_short': 'none',
        'tumbler_morning_long': 'none',
        'tumbler_morning_example_answer': 'none',

        // afternoon
        'tumbler_afternoon_short': '식후 커피?',
        'tumbler_afternoon_long': '오늘 커피는 일회용품 말고 텀블러로 마셨지?',
        'tumbler_afternoon_example_answer': '텀블러 썻지 또는 일회용품 썻지',

        // evening
        'tumbler_evening_short': 'none',
        'tumbler_evening_long': 'none',
        'tumbler_evening_example_answer': 'none',
      };

  static Map<String, String> get enTumbler => {
        // 행위 이름
        'tumbler': 'Use Tumbler',
        'tumbler_example_answer': 'Used tumbler or disposable cup',

        // dawn
        'tumbler_dawn_short': 'none',
        'tumbler_dawn_long': 'none',
        'tumbler_dawn_example_answer': 'none',

        // morning
        'tumbler_morning_short': 'none',
        'tumbler_morning_long': 'none',
        'tumbler_morning_example_answer': 'none',

        // afternoon
        'tumbler_afternoon_short': 'After meal coffee?',
        'tumbler_afternoon_long':
            'Did you drink coffee today\nwith a tumbler\ninstead of a disposable cup?',
        'tumbler_afternoon_example_answer': 'Used tumbler or disposable cup',

        // evening
        'tumbler_evening_short': 'none',
        'tumbler_evening_long': 'none',
        'tumbler_evening_example_answer': 'none',
      };

  /* ----------------------------------------------------- */
  /* ------------ EAction.publicTransportation ----------- */
  /* ----------------------------------------------------- */
  static Map<String, String> get krPublicTransportation => {
        // 행위 이름
        'publicTransportation': '대중교통 이용하기',
        'publicTransportation_example_answer': '버스타고 30분',

        // dawn
        'publicTransportation_dawn_short': 'none',
        'publicTransportation_dawn_long': 'none',
        'publicTransportation_dawn_example_answer': 'none',

        // morning
        'publicTransportation_morning_short': '출근은??',
        'publicTransportation_morning_long': '아침 출근은 어떻게 했어?\n대중교통?!',
        'publicTransportation_morning_example_answer': '버스타고 30분',

        // afternoon
        'publicTransportation_afternoon_short': 'none',
        'publicTransportation_afternoon_long': 'none',
        'publicTransportation_afternoon_example_answer': 'none',

        // evening
        'publicTransportation_evening_short': 'none',
        'publicTransportation_evening_long': 'none',
        'publicTransportation_evening_example_answer': 'none',
      };

  static Map<String, String> get enPublicTransportation => {
        // 행위 이름
        'publicTransportation': 'Use Public Transportation',
        'publicTransportation_example_answer': 'Took the bus for 30 minutes',

        // dawn
        'publicTransportation_dawn_short': 'none',
        'publicTransportation_dawn_long': 'none',
        'publicTransportation_dawn_example_answer': 'none',

        // morning
        'publicTransportation_morning_short': 'How about commuting?',
        'publicTransportation_morning_long':
            'How did you commute\nin the morning?\nPublic transportation?!',
        'publicTransportation_morning_example_answer':
            'Took the bus for 30 minutes',

        // afternoon
        'publicTransportation_afternoon_short': 'none',
        'publicTransportation_afternoon_long': 'none',
        'publicTransportation_afternoon_example_answer': 'none',

        // evening
        'publicTransportation_evening_short': 'none',
        'publicTransportation_evening_long': 'none',
        'publicTransportation_evening_example_answer': 'none',
      };
}
