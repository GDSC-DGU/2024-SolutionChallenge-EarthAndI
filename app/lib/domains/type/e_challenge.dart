enum EChallenge implements Comparable<EChallenge> {
  useEcoFriendlyProducts,
  deleteEmail,
  eatVegetarian,
  useColdWater,
  usePublicTransport,
  useReusableContainer,
  unplugDevices,
  rideBike,
  buyLocalProducts,
  recycle,
  useLED,
  useEnergyEfficiency,
  climateControl,
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
      case EChallenge.usePublicTransport:
        return 'use_public_transport.png';
      case EChallenge.useReusableContainer:
        return 'use_reusable_container.png';
      case EChallenge.unplugDevices:
        return 'unplug_devices.png';
      case EChallenge.rideBike:
        return 'ride_bike.png';
      case EChallenge.buyLocalProducts:
        return 'buy_local_products.png';
      case EChallenge.recycle:
        return 'recycle.png';
      case EChallenge.useLED:
        return 'use_led.png';
      case EChallenge.useEnergyEfficiency:
        return 'use_energy_efficiency.png';
      case EChallenge.climateControl:
        return 'climate_control.png';
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
      case EChallenge.usePublicTransport:
        return '${name}_short_title';
      case EChallenge.useReusableContainer:
        return '${name}_short_title';
      case EChallenge.unplugDevices:
        return '${name}_short_title';
      case EChallenge.rideBike:
        return '${name}_short_title';
      case EChallenge.buyLocalProducts:
        return '${name}_short_title';
      case EChallenge.recycle:
        return '${name}_short_title';
      case EChallenge.useLED:
        return '${name}_short_title';
      case EChallenge.useEnergyEfficiency:
        return '${name}_short_title';
      case EChallenge.climateControl:
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
      case EChallenge.usePublicTransport:
        return '${name}_long_title';
      case EChallenge.useReusableContainer:
        return '${name}_long_title';
      case EChallenge.unplugDevices:
        return '${name}_long_title';
      case EChallenge.rideBike:
        return '${name}_long_title';
      case EChallenge.buyLocalProducts:
        return '${name}_long_title';
      case EChallenge.recycle:
        return '${name}_long_title';
      case EChallenge.useLED:
        return '${name}_long_title';
      case EChallenge.useEnergyEfficiency:
        return '${name}_long_title';
      case EChallenge.climateControl:
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
      case EChallenge.usePublicTransport:
        return '${name}_description';
      case EChallenge.useReusableContainer:
        return '${name}_description';
      case EChallenge.unplugDevices:
        return '${name}_description';
      case EChallenge.rideBike:
        return '${name}_description';
      case EChallenge.buyLocalProducts:
        return '${name}_description';
      case EChallenge.recycle:
        return '${name}_description';
      case EChallenge.useLED:
        return '${name}_description';
      case EChallenge.useEnergyEfficiency:
        return '${name}_description';
      case EChallenge.climateControl:
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
      case 'usePublicTransport':
        return EChallenge.usePublicTransport;
      case 'useReusableContainer':
        return EChallenge.useReusableContainer;
      case 'unplugDevices':
        return EChallenge.unplugDevices;
      case 'rideBike':
        return EChallenge.rideBike;
      case 'buyLocalProducts':
        return EChallenge.buyLocalProducts;
      case 'recycle':
        return EChallenge.recycle;
      case 'useLED':
        return EChallenge.useLED;
      case 'useEnergyEfficiency':
        return EChallenge.useEnergyEfficiency;
      case 'climateControl':
        return EChallenge.climateControl;
      default:
        throw Exception('Unknown EChallenge: $name');
    }
  }
}
