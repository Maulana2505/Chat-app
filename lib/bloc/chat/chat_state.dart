import 'package:equatable/equatable.dart';

import '../../model/chat/chat_model.dart';

abstract class ChatState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadDataState extends ChatState {
  final List<Chat>? data;
  ChatLoadDataState(this.data);
  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class ChatErorrState extends ChatState {
  late String msg;
  ChatErorrState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class ChatSendState extends ChatState {}

class ChatErorrSendState extends ChatState {
  late String err;
  ChatErorrSendState(this.err);
}
