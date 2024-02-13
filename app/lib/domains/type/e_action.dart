enum EAction implements Comparable<EAction> {
  steps,
  data,
  morning,
  lunch,
  dinner,
  recycle,
  standbyPower,
  waterUsage,
  optimalTemperature,
  tumbler,
  publicTransportation,
  ;

  const EAction();

  @override
  int compareTo(EAction other) => index.compareTo(other.index);

  @override
  String toString() => name;
}
