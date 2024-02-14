class SpeechState {
  final bool _isEnableMic;
  final bool _isListening;
  final bool _isComplete;
  final String _speechText;

  bool get isEnableMic => _isEnableMic;
  bool get isListening => _isListening;
  bool get isComplete => _isComplete;
  String get speechText => _speechText;

  SpeechState({
    required bool isEnableMic,
    required bool isListening,
    required bool isComplete,
    required String speechText,
  })  : _isEnableMic = isEnableMic,
        _isListening = isListening,
        _isComplete = isComplete,
        _speechText = speechText;

  factory SpeechState.initial() {
    return SpeechState(
      isEnableMic: false,
      isListening: false,
      isComplete: false,
      speechText: '안녕!!',
    );
  }

  copyWith({
    bool? isEnableMic,
    bool? isListening,
    bool? isComplete,
    String? speechText,
  }) {
    toString();
    return SpeechState(
      isEnableMic: isEnableMic ?? _isEnableMic,
      isListening: isListening ?? _isListening,
      isComplete: isComplete ?? _isComplete,
      speechText: speechText ?? _speechText,
    );
  }

  @override
  String toString() {
    return '[SpeechState]\n'
        'isEnableMic: $_isEnableMic\n'
        'isListening: $_isListening\n'
        'isComplete: $_isComplete\n'
        'speechText: $_speechText';
  }
}
