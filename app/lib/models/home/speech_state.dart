class SpeechState {
  final bool _isEnableMic;
  final bool _isListening;
  final String _speechText;

  bool get isEnableMic => _isEnableMic;
  bool get isListening => _isListening;
  String get speechText => _speechText;

  SpeechState({
    required bool isEnableMic,
    required bool isListening,
    required String speechText,
  })  : _isEnableMic = isEnableMic,
        _isListening = isListening,
        _speechText = speechText;

  factory SpeechState.initial() {
    return SpeechState(
      isEnableMic: false,
      isListening: false,
      speechText: '안녕!!',
    );
  }

  copyWith({
    bool? isEnableMic,
    bool? isListening,
    String? speechText,
  }) {
    return SpeechState(
      isEnableMic: isEnableMic ?? _isEnableMic,
      isListening: isListening ?? _isListening,
      speechText: speechText ?? _speechText,
    );
  }
}
