enum EChallenge implements Comparable<EChallenge> {
  useEcoFriendlyProducts,
  deleteEmail,
  eatVegetarian,
  useColdWater,
  clearAllChallenge;

  const EChallenge();

  @override
  int compareTo(EChallenge other) => index.compareTo(other.index);

  @override
  String toString() => name;

  String get assetPath {
    switch (this) {
      case EChallenge.deleteEmail:
        return 'assets/icons/delete_email.png';
      case EChallenge.useEcoFriendlyProducts:
        return 'assets/icons/use_eco_friendly_products.png';
      case EChallenge.useColdWater:
        return 'assets/icons/use_cold_water.png';
      case EChallenge.eatVegetarian:
        return 'assets/icons/eat_vegetarian.png';
      case EChallenge.clearAllChallenge:
        return 'assets/icons/clear_all_challenge.png';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  static EChallenge fromName(String name) {
    switch (name) {
      case 'deleteEmail':
        return EChallenge.deleteEmail;
      case 'useEcoFriendlyProducts':
        return EChallenge.useEcoFriendlyProducts;
      case 'useColdWater':
        return EChallenge.useColdWater;
      case 'eatVegetarian':
        return EChallenge.eatVegetarian;
      case 'clearAllChallenge':
        return EChallenge.clearAllChallenge;
      default:
        throw Exception('Unknown EChallenge name: $name');
    }
  }
}
