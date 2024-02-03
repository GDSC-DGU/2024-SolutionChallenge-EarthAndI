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
          GestureDetector(
            onTap: onTapBody,
            child: AnimatedContainer(
              duration: RootViewModel.duration,
              height: 60,
              width: 60,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF90CDBE),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Obx(() {
                if (viewModel.isExpanded) {
                  return const AnimatedRotation(
                    duration: Duration(milliseconds: 200),
                    turns: 0.125,
                    child: Icon(Icons.add, color: Colors.white),
                  );
                }

                return SvgPicture.asset(
                  viewModel.selectedIndex != 1
                      ? 'assets/icons/save.svg'
                      : 'assets/icons/search.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: viewModel.isAndroid ? 85 : 50,
          ),
        ],
      ),
    );
  }

  void onTapBody() {
    if (viewModel.selectedIndex != 1) {
      viewModel.changeIndex(1);
    } else {
      viewModel.onTapFloatingActionButton();
    }
  }
}
