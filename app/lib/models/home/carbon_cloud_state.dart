class CarbonCloudState {
  final String text;
  final bool isLeftPos;

  CarbonCloudState({
    required this.text,
    required this.isLeftPos,
  });

  CarbonCloudState copyWith({
    String? text,
    bool? isLeftPos,
  }) {
    return CarbonCloudState(
      text: text ?? this.text,
      isLeftPos: isLeftPos ?? this.isLeftPos,
    );
  }
}
