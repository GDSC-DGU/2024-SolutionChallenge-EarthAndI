import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarbonCloudBubble extends StatelessWidget {
  const CarbonCloudBubble({
    super.key,
    required this.state,
    this.onTap,
  });

  final CarbonCloudState state;
  final Function(CarbonCloudState)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          if (state.isLeftPos) const Expanded(child: SizedBox()),
          SizedBox(
            width: (Get.width - 32) * 0.5,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  splashColor: Colors.grey.withOpacity(0.1),
                  onTap: () {
                    onTap?.call(state);
                  },
                  child: Container(
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8.0,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: (Get.width - 32) * 0.5,
                      maxHeight: Get.height * 0.1,
                    ),
                    child: Text(
                      state.shortQuestion.tr,
                      style: Get.deviceLocale?.languageCode == "ko"
                          ? FontSystem.KR14M
                          : FontSystem.KR12M,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          if (!state.isLeftPos) const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
