import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/view_models/sign_in/sign_in_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Gery Scale Barrier
class OverlayGreyBarrier extends BaseWidget<SignInViewModel> {
  const OverlayGreyBarrier({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: !viewModel.isEnableGreyBarrier,
        child: AnimatedContainer(
          duration: RootViewModel.duration,
          color: viewModel.isEnableGreyBarrier
              ? Colors.black.withOpacity(0.5)
              : Colors.transparent,
        ),
      ),
    );
  }
}
