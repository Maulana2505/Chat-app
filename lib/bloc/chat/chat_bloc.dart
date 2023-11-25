import 'package:bloc/bloc.dart';
import 'package:chat_app/api/chat.dart';
import 'package:chat_app/bloc/chat/chat_event.dart';
import 'package:chat_app/bloc/chat/chat_state.dart';
import 'package:chat_app/model/chat/chat_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _chat = ChatApi();
  ChatBloc() : super(ChatInitialState()) {
    on<ChatLoadDataEvent>((event, emit) async {
      try {
        final chatdata = await _chat.getchat();
        emit(ChatLoadDataState(chatdata));
      } catch (e) {
        emit(ChatErorrState(e.toString()));
      }
    });
    on<ChatSendEvent>((event, emit) async {
      try {
        _chat.sendmassage(event.ids, event.msg);
        emit(ChatSendState());
      } catch (e) {
        print(e.toString());
        emit(ChatErorrSendState(e.toString()));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    ChatBloc().close();
    return super.close();
  }
}
