enum EAction implements Comparable<EAction> {
  /* Default */
  steps(
    dawn: 'steps_dawn',
    morning: 'steps_morning',
    afternoon: 'steps_afternoon',
    evening: 'steps_evening',
  ),
  data(
    dawn: 'data_dawn',
    morning: 'data_morning',
    afternoon: 'data_afternoon',
    evening: 'data_evening',
  ),

  /* Custom */
  stairs(
    dawn: 'stair_dawn',
    morning: 'stair_morning',
    afternoon: 'stair_afternoon',
    evening: 'stair_evening',
  ),
  sns(
    dawn: 'sns_dawn',
    morning: 'sns_morning',
    afternoon: 'sns_afternoon',
    evening: 'sns_evening',
  ),
  meal(
    dawn: 'meal_dawn',
    morning: 'meal_morning',
    afternoon: 'meal_afternoon',
    evening: 'meal_evening',
  ),
  recycle(
    dawn: 'recycle_dawn',
    morning: 'recycle_morning',
    afternoon: 'recycle_afternoon',
    evening: 'recycle_evening',
  ),
  standbyPower(
    dawn: 'standbyPower_dawn',
    morning: 'standbyPower_morning',
    afternoon: 'standbyPower_afternoon',
    evening: 'standbyPower_evening',
  ),
  waterUsage(
    dawn: 'waterUsage_dawn',
    morning: 'waterUsage_morning',
    afternoon: 'waterUsage_afternoon',
    evening: 'waterUsage_evening',
  ),
  optimalTemperature(
    dawn: 'optimalTemperature_dawn',
    morning: 'optimalTemperature_morning',
    afternoon: 'optimalTemperature_afternoon',
    evening: 'optimalTemperature_evening',
  ),
  tumbler(
    dawn: 'tumbler_dawn',
    morning: 'tumbler_morning',
    afternoon: 'tumbler_afternoon',
    evening: 'tumbler_evening',
  ),
  publicTransportation(
    dawn: 'publicTransportation_dawn',
    morning: 'publicTransportation_morning',
    afternoon: 'publicTransportation_afternoon',
    evening: 'publicTransportation_evening',
  ),
  ;

  final String dawn;
  final String morning;
  final String afternoon;
  final String evening;

  const EAction({
    required this.dawn,
    required this.morning,
    required this.afternoon,
    required this.evening,
  });

  @override
  int compareTo(EAction other) => index.compareTo(other.index);

  @override
  String toString() => name;

  String getContent(int groupIndex) {
    switch (groupIndex) {
      case 0:
        return dawn;
      case 1:
        return morning;
      case 2:
        return afternoon;
      case 3:
        return evening;
      default:
        throw Exception('Invalid groupIndex: $groupIndex');
    }
  }
}
