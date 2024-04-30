import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/view_models/coming_soon_challenge/coming_soon_challenge_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/coming_soon_challenge/static/coming_soon_challenge_states.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_history_item.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:earth_and_i/widgets/dialog/challenge_dialog.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ComingSoonChallengeScreen
    extends BaseScreen<ComingSoonChallengeViewModel> {
  const ComingSoonChallengeScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "coming_soon_challenge".tr,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    List<ChallengeHistoryState> states = getComingSoonChallengeStates();
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfinityLine(
              height: 1,
              color: ColorSystem.grey[200],
            ),
            const SizedBox(height: 16),
            Opacity(
              opacity: 0.5,
              child: SizedBox(
                width: Get.width - 32,
                height: Get.height * 0.66,
                child: Image.asset(
                  "assets/images/coming_soon_challenge.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text("Comng Soon Challenge", style: FontSystem.KR24B),
            ),
            const SizedBox(height: 16),
            const Text("새로운 챌린지를 확인하고"),
            const Text("함께 실천해 나가요!"),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: viewModel.animation,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(0, viewModel.animation.value), child: child);
              },
              child: SvgPicture.asset("assets/icons/down.svg", width: 32),
            ),
            const SizedBox(height: 24),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 9,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      ChallengeHistoryItem(
                        state: states[index],
                        borderColor: ColorSystem.grey,
                        onTap: () {
                          Get.dialog(
                            ChallengeDialog(
                              state: states[index],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
