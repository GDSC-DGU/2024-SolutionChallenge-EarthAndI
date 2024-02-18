import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    required this.hour,
    required this.minute,
    required this.onCancel,
    required this.onConfirm,
  });

  final int hour;
  final int minute;
  final Function() onCancel;
  final Function(int, int) onConfirm;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late final FixedExtentScrollController _hourController;
  late final FixedExtentScrollController _minuteController;

  late int _hour;
  late int _minute;

  @override
  void initState() {
    super.initState();

    _hourController = FixedExtentScrollController(initialItem: widget.hour);
    _minuteController = FixedExtentScrollController(initialItem: widget.minute);

    _hour = widget.hour;
    _minute = widget.minute;
  }

  @override
  dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: _hourController,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        _hour = value;
                      });
                    },
                    itemExtent: 40,
                    children: [
                      for (int i = 0; i < 24; i++)
                        Center(
                          child: Text(
                            i.toString().padLeft(2, '0'),
                            style: FontSystem.KR16R,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: _minuteController,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        _minute = value;
                      });
                    },
                    itemExtent: 40,
                    children: [
                      for (int i = 0; i < 60; i++)
                        Center(
                          child: Text(
                            i.toString().padLeft(2, '0'),
                            style: FontSystem.KR16R,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    widget.onCancel();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorSystem.white,
                    side: BorderSide(
                      color: ColorSystem.grey,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'cancel'.tr,
                    style: FontSystem.KR16B.copyWith(
                      color: ColorSystem.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    widget.onConfirm(_hour, _minute);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorSystem.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'confirm'.tr,
                    style: FontSystem.KR16B.copyWith(
                      color: ColorSystem.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
