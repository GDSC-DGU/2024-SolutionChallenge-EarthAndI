import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RootFloatingActionButton extends BaseWidget<RootViewModel> {
  const RootFloatingActionButton({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => GestureDetector(
              onTap: onTapBody,
              child: AnimatedContainer(
                duration: RootViewModel.duration,
                height: 60,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: viewModel.isEnableGreyBarrier
                      ? Colors.transparent
                      : const Color(0xFF90CDBE),
                  shape: BoxShape.circle,
                ),
                child: buildFloatingActionButton(),
              ),
            ),
          ),

          // Relative to the height of the floating action button
          SizedBox(
            height: viewModel.isAndroid ? 70 : 35,
          ),
        ],
      ),
    );
  }

  void onTapBody() {
    if (viewModel.isEnableGreyBarrier) {
      return;
    }

    if (viewModel.selectedIndex != 1) {
      viewModel.changeIndex(1);
    } else {
      DevOnLog.i("Go To Challenge Screen");
    }
  }

  Widget? buildFloatingActionButton() {
    if (viewModel.isEnableGreyBarrier) {
      return null;
    }

    return SvgPicture.asset(
      viewModel.selectedIndex != 1
          ? 'assets/icons/home.svg'
          : 'assets/icons/verification_echo.svg',
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
