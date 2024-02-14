class AnalysisState {
  final bool _isLoading;
  final String _speechBubble;

  bool get isLoading => _isLoading;
  String get speechBubble => _speechBubble;

  AnalysisState({
    required bool isLoading,
    required String speechBubble,
  })  : _speechBubble = speechBubble,
        _isLoading = isLoading;

  AnalysisState copyWith({
    bool? isLoading,
    String? speechBubble,
  }) {
    return AnalysisState(
      isLoading: isLoading ?? _isLoading,
      speechBubble: speechBubble ?? _speechBubble,
    );
  }

  factory AnalysisState.initial() {
    return AnalysisState(
      isLoading: false,
      speechBubble: '안녕~~',
    );
  }

  @override
  String toString() {
    return '[AnalysisState]\n'
        'isLoading: $_isLoading'
        '\nspeechBubble: $_speechBubble';
  }
}
