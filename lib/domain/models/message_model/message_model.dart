class MessageModel {
  String message;
  bool is_mine;

  MessageModel({
    required this.is_mine,
    required this.message,
  });
}

class MessagesModel {
  List<MessageModel> messages;

  MessagesModel({
    required this.messages,
  });
}

MessagesModel dummyMessages = MessagesModel(
  messages: [
    MessageModel(
      message: "Hi, Whats You Name Firstname?",
      is_mine: false,
    ),
    MessageModel(
      message: "Abdalla",
      is_mine: true,
    ),
    MessageModel(
      message: "Ok, Abdalla Whats Your Lastname?",
      is_mine: false,
    ),
    MessageModel(
      message: "Salah",
      is_mine: true,
    ),
    MessageModel(
      message: "Mr Abdalla Salah, What's your Title? ",
      is_mine: false,
    ),
    MessageModel(
      message: "Front-end Developer",
      is_mine: true,
    ),
    MessageModel(
      message: "What Categories you will need expert In?",
      is_mine: false,
    ),
  ],
);
