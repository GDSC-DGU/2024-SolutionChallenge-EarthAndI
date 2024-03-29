import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/shapes/floor_layer_clipper.dart';
import 'package:earth_and_i/views/home/widgets/carbon_cloud.dart';
import 'package:earth_and_i/views/home/widgets/carbon_cloud_listview.dart';
import 'package:earth_and_i/views/home/widgets/speech_bubble.dart';
import 'package:earth_and_i/views/home/widgets/speech_recognize_bottom_sheet.dart';
import 'package:earth_and_i/widgets/dialog/sign_in_dialog.dart';
import 'package:earth_and_i/widgets/text/animated_num_blink_text.dart';
import 'package:earth_and_i/widgets/text/animated_num_counter_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(92.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => _totalDeltaCO2()),
            const SizedBox(width: 10),
            Obx(() => _changeDeltaCO2()),
          ],
        ),
      ),
    );
  }

  Widget _totalDeltaCO2() {
    Color color = ColorSystem.grey;

    if (viewModel.deltaCO2State.totalCO2 > 0) {
      color = ColorSystem.pink;
    } else if (viewModel.deltaCO2State.totalCO2 < 0) {
      color = ColorSystem.green;
    }

    return AnimatedNumCounterText(
      value: viewModel.deltaCO2State.totalCO2,
      textStyle: FontSystem.KR24B.copyWith(color: color),
      suffix: ' kg',
    );
  }

  Widget _changeDeltaCO2() {
    if (viewModel.deltaCO2State.changeCO2 == 0) {
      return const SizedBox();
    }

    Color color = viewModel.deltaCO2State.changeCO2 > 0
        ? ColorSystem.pink
        : ColorSystem.green;
    String prefix = viewModel.deltaCO2State.changeCO2 > 0 ? "↑ " : "↓ ";
    String value = NumberFormat('###,###,###,###.####')
        .format(viewModel.deltaCO2State.changeCO2.abs());

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: AnimatedNumBlinkText(
        value: '$prefix$value kg',
        duration: const Duration(milliseconds: 800),
        textStyle: FontSystem.KR16B.copyWith(color: color),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          _floorLayer(),
          _carbonCloudLayer(),
          _characterLayer(),
        ],
      ),
    );
  }

  Widget _floorLayer() => Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: FloorLayerClipper(),
          child: Container(
            width: Get.width,
            height:
                GetPlatform.isAndroid ? Get.height * 0.25 : Get.height * 0.27,
            color: const Color(0xFFF3F0EB),
          ),
        ),
      );

  Widget _characterLayer() => Positioned(
        left: 0,
        right: 0,
        bottom: GetPlatform.isAndroid ? Get.height * 0.20 : Get.height * 0.22,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            children: [
              const SpeechBubble(),
              const SizedBox(height: 10),
              Obx(
                () {
                  // 각 스탯에 따라 이미지 경로 결정
                  String prefix = viewModel.analysisState.isLoading
                      ? 'assets/images/analysis/'
                      : 'assets/images/character/';
                  String suffix = '.svg';

                  String environment =
                      viewModel.characterStatsState.isEnvironmentCondition
                          ? '1'
                          : '2';
                  String health =
                      viewModel.characterStatsState.isHealthCondition
                          ? '1'
                          : '2';
                  String mental =
                      viewModel.characterStatsState.isMentalCondition
                          ? '1'
                          : '2';
                  String cash =
                      viewModel.characterStatsState.isCashCondition ? '1' : '2';

                  return SvgPicture.asset(
                    viewModel.analysisState.isLoading
                        ? '$prefix${health}_${mental}_$cash$suffix'
                        : '$prefix${environment}_${health}_${mental}_$cash$suffix',
                    height: Get.height * 0.2,
                  );
                },
              ),
            ],
          ),
        ),
      );

  Widget _carbonCloudLayer() => Positioned(
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: Get.height * 0.3,
            child: Obx(
              () {
                return CarbonCloudListView(
                  listKey: GlobalKey<AnimatedListState>(),
                  itemCount: viewModel.carbonCloudStates.length < 4
                      ? viewModel.carbonCloudStates.length
                      : 4,
                  items: viewModel.carbonCloudStates,
                  onTapItem: (state) {
                    if (state.groupIndex != _getTimeSection(DateTime.now())) {
                      viewModel.fetchCarbonCloudStates(DateTime.now());
                      _showSnackBar(
                        'time_exception_title'.tr,
                        'time_exception_content'.tr,
                      );

                      return;
                    }

                    if (!SecurityUtil.isSignin) {
                      Get.dialog(
                        const SignInDialog(),
                      );

                      return;
                    }

                    if (viewModel.analysisState.isLoading) {
                      _showSnackBar(
                        'analysis_snackBar_title'.tr,
                        'analysis_snackBar_content'.tr,
                      );

                      return;
                    }
                    int index = viewModel.carbonCloudStates.indexOf(state);
                    viewModel.onReadySpeechState();

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
                  itemBuilder: (state, animation, onTap) {
                    Animation<double> fadeAnimate = Tween(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(animation);

                    return FadeTransition(
                      opacity: fadeAnimate,
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: CarbonCloudBubble(
                          state: state,
                          onTap: onTap,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

  int _getTimeSection(DateTime currentAt) {
    return currentAt.hour ~/ 6;
  }

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(seconds: 2),
      backgroundColor: ColorSystem.grey.withOpacity(0.3),
    );
  }
}
