abstract class EChallengeTranslations {
  static Map<String, String> get kr => {
        ...krUseEcoFriendlyProducts,
        ...krDeleteEmail,
        ...krEatVegetarian,
        ...krUseColdWater,
        ...krClearAllChallenge,
      };

  static Map<String, String> get en => {
        ...enUseEcoFriendlyProducts,
        ...enDeleteEmail,
        ...enEatVegetarian,
        ...enUseColdWater,
        ...enClearAllChallenge,
      };

  static Map<String, String> get krUseEcoFriendlyProducts => {
        'useEcoFriendlyProductsShortTitle': '친환경 제품 사용하기',
        'useEcoFriendlyProductsLongTitle': '친환경 제품 마크가 부착된 상품을 구매해요!',
        'useEcoFriendlyProductsDescription':
            '친환경 마크를 통해서 제품의 생산과정에서 발생한 탄소의 양을 라벨 형태로 제품에 표시해 저탄소 제품을 쉽게 판별할 수 있도록 도와줍니다.',
        'useEcoFriendlyProductsIconPath':
            'assets/icons/use_eco_friendly_products.png',
      };

  static Map<String, String> get enUseEcoFriendlyProducts => {
        'useEcoFriendlyProductsShortTitle': 'Use Eco-Friendly Products',
        'useEcoFriendlyProductsLongTitle':
            'Buy products with the eco-friendly product mark!',
        'useEcoFriendlyProductsDescription':
            'The eco-friendly mark helps to easily identify low-carbon products by displaying the amount of carbon generated in the production process in label form.',
        'useEcoFriendlyProductsIconPath':
            'assets/icons/eco_friendly_products.png',
      };

  static Map<String, String> get krDeleteEmail => {
        'deleteEmailShortTitle': '쌓아둔 이메일 삭제하기',
        'deleteEmailLongTitle': '쌓아두었던 불필요한 이메일을 삭제해요!',
        'deleteEmailDescription':
            '이메일 데이터를 보관하기 위하여 서버를 가동하기 때문에 에너지를 소모합니다. 메일함 1GB를 비우면 탄소를 14.9㎏ 감축할 수 있습니다!',
        'deleteEmailIconPath': 'assets/icons/delete_email.png',
      };

  static Map<String, String> get enDeleteEmail => {
        'deleteEmailShortTitle': 'Delete Email',
        'deleteEmailLongTitle': 'Delete unnecessary emails!',
        'deleteEmailDescription':
            'Storing email data requires server operation, which consumes energy. Emptying 1GB of mailbox can reduce carbon by 14.9㎏!',
        'deleteEmailIconPath': 'assets/icons/delete_email.png',
      };

  static Map<String, String> get krEatVegetarian => {
        'eatVegetarianShortTitle': '채식하기',
        'eatVegetarianLongTitle': '육류가 없는 식단을 올려주세요!',
        'eatVegetarianDescription':
            '채식을 통해 축산업에서 발생하는 탄소를 줄입니다. 하루 한 끼 채식으로 전환할 시에 약 3.25kg 탄소배출을 감축할 수 있습니다!',
        'eatVegetarianIconPath': 'assets/icons/eat_vegetarian.png',
      };

  static Map<String, String> get enEatVegetarian => {
        'eatVegetarianShortTitle': 'Eat Vegetarian',
        'eatVegetarianLongTitle': 'Post a diet without meat!',
        'eatVegetarianDescription':
            'Reduce carbon emissions from livestock by eating vegetarian. By converting one meal a day to vegetarian, you can reduce carbon emissions by about 3.25kg!',
        'eatVegetarianIconPath': 'assets/icons/eat_vegetarian.png',
      };

  static Map<String, String> get krUseColdWater => {
        'useColdWaterShortTitle': '찬물로 세탁하기',
        'useColdWaterLongTitle': '세탁기의 온도를 찬물로 설정해요!',
        'useColdWaterDescription':
            '찬물으로 옷을 세탁하면, 뜨거운 물을 가열하기 위한 에너지의 양이 줄어듭니다. 이를 통해서 탄소 사용을 10% 감소시킬 수 있습니다!',
        'useColdWaterIconPath': 'assets/icons/use_cold_water.png',
      };

  static Map<String, String> get enUseColdWater => {
        'useColdWaterShortTitle': 'Use Cold Water',
        'useColdWaterLongTitle':
            'Set the washing machine temperature to cold water!',
        'useColdWaterDescription':
            'Washing clothes with cold water reduces the amount of energy required to heat hot water. This can reduce carbon use by 10%!',
        'useColdWaterIconPath': 'assets/icons/use_cold_water.png',
      };

  static Map<String, String> get krClearAllChallenge => {
        'clearAllChallengeShortTitle': '모든 챌린지 클리어!',
        'clearAllChallengeLongTitle': '모든 챌린지를 클리어했어요!',
        'clearAllChallengeDescription': '모든 챌린지를 클리어했어요!\n 다음 챌린지를 기다려주세요!',
        'clearAllChallengeIconPath': 'assets/icons/clear_challenge.png',
      };

  static Map<String, String> get enClearAllChallenge => {
        'clearAllChallengeShortTitle': 'Clear All Challenge',
        'clearAllChallengeLongTitle': 'You have cleared all challenges!',
        'clearAllChallengeDescription':
            'You have cleared all challenges! Please wait for the next challenge!',
        'clearAllChallengeIconPath': 'assets/icons/clear_challenge.png',
      };
}
