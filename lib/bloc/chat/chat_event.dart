import 'package:equatable/equatable.dart';


abstract class ChatEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatLoadDataEvent extends ChatEvent{
  
}

class ChatSendEvent extends ChatEvent{
  final String ids;
  final String msg;
  ChatSendEvent({required this.ids,required this.msg});
}