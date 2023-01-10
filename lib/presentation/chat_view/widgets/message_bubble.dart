import 'package:flutter/material.dart';

import 'package:task9_1/domain/models/message_model/message_model.dart';
import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.is_mine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.is_mine)
          Container(
            height: AppSize.s40,
            width: AppSize.s40,
            decoration: BoxDecoration(
              color: ColorManager.lightGrey,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(
                  "asset/images/robetec.png",
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
            padding: const EdgeInsets.only(left: AppPadding.p14),
          ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            decoration: BoxDecoration(
              color: message.is_mine ? ColorManager.primary : ColorManager.lightGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(14),
                bottomRight: message.is_mine ? const Radius.circular(0) : const Radius.circular(14),
                topLeft: message.is_mine ? const Radius.circular(14) : const Radius.circular(0),
                topRight: const Radius.circular(14),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p25,
              horizontal: AppPadding.p30,
            ),
            margin: const EdgeInsets.all(AppMargin.m8),
            child: Column(
              crossAxisAlignment: message.is_mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                  child: Wrap(
                    children: [
                      Text(
                        message.message,
                        maxLines: 10,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: message.is_mine ? ColorManager.white : ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (message.is_mine)
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p14),
            child: Image.asset("asset/icons/read_icon.png"),
          ),
      ],
    );
  }
}
