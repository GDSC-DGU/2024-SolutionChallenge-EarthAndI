enum EChallenge implements Comparable<EChallenge> {
  useEcoFriendlyProducts,
  deleteEmail,
  eatVegetarian,
  useColdWater,
  ;

  const EChallenge();

  @override
  int compareTo(EChallenge other) => index.compareTo(other.index);

  @override
  String toString() => name;

  String get assetPath {
    switch (this) {
      case EChallenge.deleteEmail:
        return 'delete_email.png';
      case EChallenge.useEcoFriendlyProducts:
        return 'use_eco_friendly_products.png';
      case EChallenge.useColdWater:
        return 'use_cold_water.png';
      case EChallenge.eatVegetarian:
        return 'eat_vegetarian.png';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  String get shortTitle {
    switch (this) {
      case EChallenge.deleteEmail:
        return '${name}ShortTitle';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}ShortTitle';
      case EChallenge.useColdWater:
        return '${name}ShortTitle';
      case EChallenge.eatVegetarian:
        return '${name}ShortTitle';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  String get longTitle {
    switch (this) {
      case EChallenge.deleteEmail:
        return '${name}LongTitle';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}LongTitle';
      case EChallenge.useColdWater:
        return '${name}LongTitle';
      case EChallenge.eatVegetarian:
        return '${name}LongTitle';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  String get description {
    switch (this) {
      case EChallenge.deleteEmail:
        return '${name}Description';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}Description';
      case EChallenge.useColdWater:
        return '${name}Description';
      case EChallenge.eatVegetarian:
        return '${name}Description';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  static EChallenge? fromName(String? name) {
    switch (name) {
      case 'deleteEmail':
        return EChallenge.deleteEmail;
      case 'useEcoFriendlyProducts':
        return EChallenge.useEcoFriendlyProducts;
      case 'useColdWater':
        return EChallenge.useColdWater;
      case 'eatVegetarian':
        return EChallenge.eatVegetarian;
      default:
        return null;
    }
  }
}
