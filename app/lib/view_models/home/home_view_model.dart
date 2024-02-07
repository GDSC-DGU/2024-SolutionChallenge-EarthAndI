import 'dart:math';

import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/models/home/speech_state.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeViewModel extends GetxController {
  late final SpeechToText _speechModule;

  late final RxInt _reducedCO2;
  late final RxBool _isLoadingAnalysis;
  late final Rx<SpeechState> _speechState;
  late final RxList<CarbonCloudState> _carbonCloudStates;

  int get reducedCO2 => _reducedCO2.value;
  bool get isLoadingAnalysis => _isLoadingAnalysis.value;
  SpeechState get speechState => _speechState.value;
  RxList<CarbonCloudState> get carbonCloudStates => _carbonCloudStates;

  @override
  void onInit() async {
    super.onInit();

    _speechModule = SpeechToText();

    _reducedCO2 = 12000.obs;
    _isLoadingAnalysis = false.obs;
    _carbonCloudStates = [
      CarbonCloudState(text: '자기전에 너튜브, 인스타\n보지말고 잘꺼지?!', isLeftPos: true),
      CarbonCloudState(text: '우린 멀 할 수 있지?\n팝콘이나 먹고 자자!', isLeftPos: false),
      CarbonCloudState(text: '오늘 점심 뭐 먹었어?', isLeftPos: true),
      CarbonCloudState(text: '왜 우린 쉬지 못하지?\n 나도 몰라 이 녀석아!', isLeftPos: false),
      CarbonCloudState(text: '오늘 저녁은 뭐였을까?', isLeftPos: true),
    ].obs;

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

  void startSpeech(int index) async {
    await _speechModule.listen(
      onResult: (result) {
        if (result.finalResult) {
          _speechState.value = _speechState.value.copyWith(
            speechText: result.recognizedWords,
          );
          analysisSpeech();
          _carbonCloudStates.removeAt(index);
          _reducedCO2.value += Random().nextInt(100);
        }
      },
      localeId: 'ko_KR',
    );

    Get.find<RootViewModel>().changeMicState();
  }

  void stopSpeech() async {
    await _speechModule.stop();
    Get.find<RootViewModel>().changeMicState();
  }
}
