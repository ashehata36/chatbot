import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/presentation/chat_view/cubit/cubit.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';

import '../cubit/states.dart';

class SendBar extends StatelessWidget {
  SendBar({
    super.key,
  });

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chatCubit = ChatCubit.get(context);
    return BlocProvider<ChatCubit>(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, states) {},
        builder: (context, states) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p14,
            vertical: AppPadding.p20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xfff6f7f8), borderRadius: BorderRadius.circular(AppSize.s12)),
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "asset/icons/lang_icon.png",
                            color: const Color(0xff77838f),
                          ),
                          suffixIcon: Image.asset(
                            "asset/icons/voice_icon.png",
                            color: const Color(0xff77838f),
                          ),
                          hintText: "Type something…",
                          hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: FontSize.s14,
                                color: const Color(0xff77838f),
                              ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        chatCubit.addMessageChat(message: messageController.text);
                      }
                    },
                    icon: Image.asset("asset/icons/send_icon.png"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
