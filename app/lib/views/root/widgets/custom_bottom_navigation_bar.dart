import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/root/shapes/custom_bottom_navigation_bar_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.transparent,
            shadows: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
            shape: CustomBottomNavigationBarShape(),
          ),
          child: BottomAppBar(
            elevation: 0,
            height: GetPlatform.isAndroid ? 80 : 65,
            color: Colors.white,
            padding: const EdgeInsets.all(0),
            shape: const CircularNotchedRectangle(),
            notchMargin: 10.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavigationBarItem(
                  index: 0,
                  size: 32,
                  svgPath: 'assets/icons/load_map.svg',
                ),
                const Flexible(
                  child: SizedBox(
                    width: 80,
                  ),
                ),
                _buildBottomNavigationBarItem(
                  index: 2,
                  size: 32,
                  svgPath: 'assets/icons/profile.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem({
    required int index,
    required double size,
    required String svgPath,
  }) =>
      Expanded(
        child: InkWell(
          onTap: () => viewModel.changeIndex(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SvgPicture.asset(
              svgPath,
              width: size,
              colorFilter: viewModel.selectedIndex == index
                  ? const ColorFilter.mode(Color(0xFF90CDBE), BlendMode.srcATop)
                  : const ColorFilter.mode(
                      Color(0xFF67686D), BlendMode.srcATop),
            ),
          ),
        ),
      );
}
