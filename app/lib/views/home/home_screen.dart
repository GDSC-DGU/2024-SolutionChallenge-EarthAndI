import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/widgets/character_layer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(92.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        height: 92.0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${NumberFormat('###,###,###,###').format(viewModel.reducedCO2)} kg',
            style: FontSystem.KR24B,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'Home Screen',
        style: FontSystem.KR24B,
      ),
    );
  }

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;
}
