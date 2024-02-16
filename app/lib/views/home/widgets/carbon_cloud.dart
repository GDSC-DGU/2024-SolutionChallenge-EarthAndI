import 'package:auto_size_text/auto_size_text.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/home/widgets/speech_recognize_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarbonCloudBubble extends BaseWidget<HomeViewModel> {
  const CarbonCloudBubble({super.key, required this.index});

  final int index;

  @override
  Widget buildView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          if (viewModel.carbonCloudStates[index].isLeftPos)
            const Expanded(child: SizedBox()),
          SizedBox(
            width: (Get.width - 32) * 0.5,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xFFF3F1EE).withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.11),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    splashColor: Colors.grey.withOpacity(0.1),
                    onTap: () {
                      viewModel.initializeSpeechState();

                      // Show Bottom Sheet
                      Get.bottomSheet(
                        SpeechRecognizeBottomSheet(
                          index: index,
                        ),
                        isScrollControlled: true,
                        enableDrag: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                      ).then((value) => {
                            // If Speech State is Complete, Analysis Speech
                            // Else, Force Stop Speech(Stop Listening)
                            viewModel.speechState.isComplete
                                ? viewModel.analysisSpeech(index)
                                : viewModel.forceStopSpeech(),
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: (Get.width - 32) * 0.5,
                        maxHeight: Get.height * 0.1,
                      ),
                      child: AutoSizeText(
                        viewModel.carbonCloudStates[index].shortQuestion.tr,
                        style: FontSystem.KR14M,
                        maxFontSize: 14.0,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          if (!viewModel.carbonCloudStates[index].isLeftPos)
            const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
