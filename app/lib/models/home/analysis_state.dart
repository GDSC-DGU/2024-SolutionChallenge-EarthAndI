class AnalysisState {
  final bool isLoading;
  final String speechBubble;

  AnalysisState({
    required this.isLoading,
    required this.speechBubble,
  });

  AnalysisState copyWith({
    bool? isLoading,
    String? speechBubble,
  }) {
    return AnalysisState(
      isLoading: isLoading ?? this.isLoading,
      speechBubble: speechBubble ?? this.speechBubble,
    );
  }

  factory AnalysisState.initial() {
    return AnalysisState(
      isLoading: false,
      speechBubble: 'hello',
    );
  }

  @override
  String toString() {
    return '[AnalysisState]\n'
        'isLoading: $isLoading\n'
        'speechBubble: $speechBubble\n';
  }
}
