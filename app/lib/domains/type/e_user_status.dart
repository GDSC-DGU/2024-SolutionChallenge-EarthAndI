enum EUserStatus implements Comparable<EUserStatus> {
  health,
  mental,
  cash,
  ;

  const EUserStatus();

  @override
  int compareTo(EUserStatus other) => index.compareTo(other.index);

  @override
  String toString() => name;
}
