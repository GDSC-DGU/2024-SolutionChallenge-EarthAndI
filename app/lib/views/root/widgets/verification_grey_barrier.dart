import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Gery Scale Barrier
class VerificationGreyBarrier extends BaseWidget<RootViewModel> {
  const VerificationGreyBarrier({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: !viewModel.isExpanded,
        child: InkWell(
          onTap: () {
            viewModel.onTapFloatingActionButton();
          },
          child: AnimatedContainer(
            duration: RootViewModel.duration,
            color: viewModel.isExpanded
                ? Colors.black.withOpacity(0.5)
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
