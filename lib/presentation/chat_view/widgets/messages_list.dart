import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/presentation/chat_view/cubit/cubit.dart';
import 'package:task9_1/presentation/chat_view/cubit/states.dart';
import 'package:task9_1/presentation/chat_view/widgets/message_bubble.dart';
import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    var chatCubit = ChatCubit.get(context);
    return BlocProvider<ChatCubit>(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, states) {},
        builder: (context, states) => Scaffold(
          backgroundColor: ColorManager.white,
          body: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...chatCubit.chatMessages
                    .map(
                      (e) => MessageBubble(message: e),
                    )
                    .toList(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppSize.s40 + AppSize.s14,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...chatCubit.checkBoxesItem
                          .map(
                            (e) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            "asset/icons/not_selected.png",
                                            color: e.isChecked ? ColorManager.primary : ColorManager.grey,
                                          ),
                                          Image.asset(
                                            "asset/icons/right_icon.png",
                                            color: e.isChecked ? ColorManager.white : ColorManager.grey,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: AppSize.s12),
                                      Text(
                                        e.title,
                                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                              fontSize: FontSize.s14,
                                            ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    chatCubit.toggleCheckBoxByItsTitle(title: e.title);
                                  },
                                ),
                                const SizedBox(height: AppSize.s14),
                              ],
                            ),
                          )
                          .toList(),
                      Text(
                        "Say Done, Or Press Send to Apply",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: FontSize.s14, color: const Color(0xff999999)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}
