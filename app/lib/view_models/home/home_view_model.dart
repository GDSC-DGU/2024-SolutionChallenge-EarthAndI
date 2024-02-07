import 'package:earth_and_i/models/home/speech_state.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeViewModel extends GetxController {
  late final SpeechToText _speechModule;

  late final RxInt _reducedCO2;
  late final RxBool _isLoadingAnalysis;
  late final Rx<SpeechState> _speechState;

  int get reducedCO2 => _reducedCO2.value;
  bool get isLoadingAnalysis => _isLoadingAnalysis.value;
  SpeechState get speechState => _speechState.value;

  @override
  void onInit() async {
    super.onInit();

    _speechModule = SpeechToText();
    _reducedCO2 = 12000.obs;
    _isLoadingAnalysis = false.obs;

    _speechState = SpeechState.initial().obs;
    _speechState.value = _speechState.value.copyWith(
      isEnableMic: await _speechModule.initialize(),
    );
  }

  void analysisSpeech() async {
    _isLoadingAnalysis.value = true;
    await Future.delayed(const Duration(seconds: 3));
    _isLoadingAnalysis.value = false;
  }

  void startSpeech() async {
    Get.find<RootViewModel>().changeMicState();

    await _speechModule.listen(
      onResult: (result) {
        if (result.finalResult) {
          _speechState.value = _speechState.value.copyWith(
            speechText: result.recognizedWords,
          );
          analysisSpeech();
        }
      },
      localeId: 'ko_KR',
    );
  }

  void stopSpeech() async {
    await _speechModule.stop();
    Get.find<RootViewModel>().changeMicState();
  }
}
