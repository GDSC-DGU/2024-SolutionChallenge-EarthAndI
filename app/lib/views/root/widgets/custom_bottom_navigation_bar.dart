import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
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
        child: BottomAppBar(
          elevation: 0,
          color: Colors.black,
          padding: const EdgeInsets.all(0),
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavigationBarItem(
                  index: 0,
                  size: 24,
                  svgPath: 'assets/icons/save.svg',
                ),
                const Flexible(
                  child: SizedBox(
                    width: 80,
                  ),
                ),
                _buildBottomNavigationBarItem(
                  index: 2,
                  size: 24,
                  svgPath: 'assets/icons/save.svg',
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
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SvgPicture.asset(
              svgPath,
              width: size,
              colorFilter: viewModel.selectedIndex == index
                  ? const ColorFilter.mode(Color(0xFFD097F4), BlendMode.srcATop)
                  : const ColorFilter.mode(
                      Color(0xFF67686D), BlendMode.srcATop),
            ),
          ),
        ),
      );
}
