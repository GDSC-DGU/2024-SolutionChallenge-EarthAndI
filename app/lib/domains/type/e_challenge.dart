enum EChallenge implements Comparable<EChallenge> {
  deleteEmail,
  useEcoFriendlyProducts,
  useColdWater,
  ;

  const EChallenge();

  @override
  int compareTo(EChallenge other) => index.compareTo(other.index);

  @override
  String toString() => name;
}
