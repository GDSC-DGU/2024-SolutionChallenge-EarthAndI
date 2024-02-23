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
        return '${name}_short_title';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}_short_title';
      case EChallenge.useColdWater:
        return '${name}_short_title';
      case EChallenge.eatVegetarian:
        return '${name}_short_title';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  String get longTitle {
    switch (this) {
      case EChallenge.deleteEmail:
        return '${name}_long_title';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}_long_title';
      case EChallenge.useColdWater:
        return '${name}_long_title';
      case EChallenge.eatVegetarian:
        return '${name}_long_title';
      default:
        throw Exception('Unknown EChallenge: $this');
    }
  }

  String get description {
    switch (this) {
      case EChallenge.deleteEmail:
        return '${name}_description';
      case EChallenge.useEcoFriendlyProducts:
        return '${name}_description';
      case EChallenge.useColdWater:
        return '${name}_description';
      case EChallenge.eatVegetarian:
        return '${name}_description';
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
        throw Exception('Unknown EChallenge: $name');
    }
  }
}
