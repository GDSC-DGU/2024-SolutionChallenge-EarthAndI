enum EAction {
  steps,
  data,
  morning,
  lunch,
  dinner,
  standbyPower,
  waterUsage,
  optimalTemperature,
  tumbler,
  publicTransportation,
  ;

  String get databaseValue => toString().split('.').last;
}
