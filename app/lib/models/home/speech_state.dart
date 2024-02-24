class SpeechState {
  final bool isEnableMic;
  final bool isListening;
  final bool isComplete;
  final String speechText;

  SpeechState({
    required this.isEnableMic,
    required this.isListening,
    required this.isComplete,
    required this.speechText,
  });

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
    return SpeechState(
      isEnableMic: isEnableMic ?? this.isEnableMic,
      isListening: isListening ?? this.isListening,
      isComplete: isComplete ?? this.isComplete,
      speechText: speechText ?? this.speechText,
    );
  }

  @override
  String toString() {
    return '[SpeechState]\n'
        'isEnableMic: $isEnableMic\n'
        'isListening: $isListening\n'
        'isComplete: $isComplete\n'
        'speechText: $speechText\n';
  }
}
