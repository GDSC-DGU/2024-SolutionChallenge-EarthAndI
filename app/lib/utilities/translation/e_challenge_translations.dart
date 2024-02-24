abstract class EChallengeTranslations {
  static Map<String, String> get kr => {
        ...krUseEcoFriendlyProducts,
        ...krDeleteEmail,
        ...krEatVegetarian,
        ...krUseColdWater,
      };

  static Map<String, String> get en => {
        ...enUseEcoFriendlyProducts,
        ...enDeleteEmail,
        ...enEatVegetarian,
        ...enUseColdWater,
      };

  static Map<String, String> get krUseEcoFriendlyProducts => {
        'useEcoFriendlyProducts_short_title': '친환경 제품 사용하기',
        'useEcoFriendlyProducts_long_title': '친환경 제품 마크가 부착된 상품을 구매해요!',
        'useEcoFriendlyProducts_description':
            '친환경 마크를 통해서 제품의 생산과정에서 발생한 탄소의 양을 라벨 형태로 제품에 표시해 저탄소 제품을 쉽게 판별할 수 있도록 도와줍니다.',
      };

  static Map<String, String> get enUseEcoFriendlyProducts => {
        'useEcoFriendlyProducts_short_title': 'Use Eco-Friendly Products',
        'useEcoFriendlyProducts_long_title':
            'Buy products with the eco-friendly product mark!',
        'useEcoFriendlyProducts_description':
            'The eco-friendly mark helps to easily identify low-carbon products by displaying the amount of carbon generated in the production process in label form.',
      };

  static Map<String, String> get krDeleteEmail => {
        'deleteEmail_short_title': '쌓아둔 이메일 삭제하기',
        'deleteEmail_long_title': '쌓아두었던 불필요한 이메일을 삭제해요!',
        'deleteEmail_description':
            '이메일 데이터를 보관하기 위하여 서버를 가동하기 때문에 에너지를 소모합니다. 메일함 1GB를 비우면 탄소를 14.9㎏ 감축할 수 있습니다!',
      };

  static Map<String, String> get enDeleteEmail => {
        'deleteEmail_short_title': 'Delete Email',
        'deleteEmail_long_title': 'Delete unnecessary emails!',
        'deleteEmail_description':
            'Storing email data requires server operation, which consumes energy. Emptying 1GB of mailbox can reduce carbon by 14.9㎏!',
      };

  static Map<String, String> get krEatVegetarian => {
        'eatVegetarian_short_title': '채식하기',
        'eatVegetarian_long_title': '육류가 없는 식단을 올려주세요!',
        'eatVegetarian_description':
            '채식을 통해 축산업에서 발생하는 탄소를 줄입니다. 하루 한 끼 채식으로 전환할 시에 약 3.25kg 탄소배출을 감축할 수 있습니다!',
      };

  static Map<String, String> get enEatVegetarian => {
        'eatVegetarian_short_title': 'Eat Vegetarian',
        'eatVegetarian_long_title': 'Post a diet without meat!',
        'eatVegetarian_description':
            'Reduce carbon emissions from livestock by eating vegetarian. By converting one meal a day to vegetarian, you can reduce carbon emissions by about 3.25kg!',
      };

  static Map<String, String> get krUseColdWater => {
        'useColdWater_short_title': '찬물로 세탁하기',
        'useColdWater_long_title': '세탁기의 온도를 찬물로 설정해요!',
        'useColdWater_description':
            '찬물으로 옷을 세탁하면, 뜨거운 물을 가열하기 위한 에너지의 양이 줄어듭니다. 이를 통해서 탄소 사용을 10% 감소시킬 수 있습니다!',
      };

  static Map<String, String> get enUseColdWater => {
        'useColdWater_short_title': 'Use Cold Water',
        'useColdWater_long_title':
            'Set the washing machine temperature to cold water!',
        'useColdWater_description':
            'Washing clothes with cold water reduces the amount of energy required to heat hot water. This can reduce carbon use by 10%!',
      };
}
