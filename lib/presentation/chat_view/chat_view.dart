import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task9_1/presentation/chat_view/cubit/cubit.dart';
import 'package:task9_1/presentation/chat_view/cubit/states.dart';
import 'package:task9_1/presentation/chat_view/widgets/messages_list.dart';
import 'package:task9_1/presentation/chat_view/widgets/send_bar.dart';
import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/routes.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatCubit>(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, states) {},
        builder: (context, states) => Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.bottomBarPageRoute);
              },
              icon: const Icon(
                FontAwesomeIcons.xmark,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: MessagesList(),
                ),
                SendBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
