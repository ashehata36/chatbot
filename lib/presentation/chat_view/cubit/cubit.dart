import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/domain/models/check_box_model/check_box_model.dart';
import 'package:task9_1/domain/models/message_model/message_model.dart';
import 'package:task9_1/presentation/chat_view/cubit/states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  List<MessageModel> chatMessages = dummyMessages.messages;
  List<CheckBoxModel> checkBoxesItem = dummyCheckBoxes.checkBoxesItems;

  void addMessageChat({required String message}) {
    chatMessages.add(
      MessageModel(is_mine: true, message: message),
    );
    emit(ChatChangeState());
  }

  toggleCheckBoxByItsTitle({required String title}) {
    for (int i = 0; i < checkBoxesItem.length; i++) {
      if (checkBoxesItem[i].title == title) {
        checkBoxesItem[i].isChecked = !checkBoxesItem[i].isChecked;
      }
    }
    emit(ChatChangeCheckBoxState());
  }
}
