import 'package:earth_and_i/models/ranking/message_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/widgets/button/rounded_rectangle_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MessageDialog extends StatefulWidget {
  const MessageDialog({
    super.key,
    required this.state,
    required this.onSend,
  });

  final MessageState state;
  final Function(String) onSend;

  @override
  State<MessageDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog> {
  late TextEditingController _controller;
  late String message;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    message = widget.state.message;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            userInfoView(),
            const SizedBox(height: 20),
            messageView(),
            const SizedBox(height: 20),
            sendButton(),
          ],
        ),
      ),
    );
  }

  Widget userInfoView() => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorSystem.grey[200],
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                SvgPicture.asset(
                  widget.state.thumbnailPath,
                  height: 48,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: Get.width * 0.7 - 100,
            child: Text(
              widget.state.nickname,
              overflow: TextOverflow.ellipsis,
              style: FontSystem.KR24M.copyWith(
                color: ColorSystem.grey[900],
              ),
            ),
          ),
        ],
      );

  Widget messageView() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSystem.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,
          onChanged: (value) {
            setState(() {
              message = value;
            });
          },
          cursorColor: ColorSystem.grey,
          decoration: InputDecoration(
            hintText: 'message_hint'.tr,
            hintStyle: FontSystem.KR14M.copyWith(
              color: ColorSystem.grey[400],
            ),
            border: InputBorder.none,
            // 패딩 없애기
            contentPadding: EdgeInsets.zero,
          ),
          style: FontSystem.KR16M.copyWith(
            color: ColorSystem.grey[900],
          ),
          maxLength: 20,
          maxLines: 2,
        ),
      );

  Widget sendButton() => SizedBox(
        width: double.infinity,
        height: 50,
        child: RoundedRectangleTextButton(
          text: 'send'.tr,
          textStyle: FontSystem.KR16B.copyWith(
            color: ColorSystem.white,
          ),
          height: 50,
          backgroundColor: ColorSystem.green,
          foregroundColor: ColorSystem.white,
          onPressed: message.isNotEmpty
              ? () {
                  widget.onSend(message);
                  Get.back();
                }
              : null,
        ),
      );
}
