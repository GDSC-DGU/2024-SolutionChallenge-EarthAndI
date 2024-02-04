import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Verification Menu
class VerificationMenu extends BaseWidget<RootViewModel> {
  const VerificationMenu({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: IgnorePointer(
          ignoring: !viewModel.isExpanded,
          child: AnimatedOpacity(
            opacity: viewModel.isExpanded ? 1 : 0,
            duration: RootViewModel.duration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Verification menu
                Container(
                  width: Get.width * 0.4,
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      floatItem(
                        redirectUrl: '/bil-verification',
                        title: '고지서 인증',
                      ),
                      const InfinityLine(
                        height: 1,
                        color: Color(0xFFE5E5E5),
                      ),
                      floatItem(
                        redirectUrl: '/carbon-verification',
                        title: '탄소 인증',
                      ),
                    ],
                  ),
                ),

                // Relative to the height of the Verification Menu
                SizedBox(
                  height: 55 + (viewModel.isAndroid ? 100 : 65),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Floating item
  Widget floatItem({
    required String redirectUrl,
    required String title,
  }) =>
      InkWell(
        onTap: () {
          DevOnLog.i('redirectUrl: $redirectUrl');
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: Center(
            child: Text(title),
          ),
        ),
      );
}
