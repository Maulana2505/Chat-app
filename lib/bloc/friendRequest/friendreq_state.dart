// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

import 'package:chat_app/model/friend_request/friendreq_model.dart';

abstract class FriendreqState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FriendreqInitialState extends FriendreqState{}

class FriendreqLoadingState extends FriendreqState{}

class FriendreqLoadDataState extends FriendreqState{
  final List<Friendrequest>? data;

  FriendreqLoadDataState(this.data);
  
  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class FriendreqErorrState extends FriendreqState{
  late String msg;
  FriendreqErorrState(this.msg);
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class FriendaccSuccesState extends FriendreqState{
}
class FriendaccErorState extends FriendreqState {
  String msg;
  FriendaccErorState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class FriendAddSuscesState extends FriendreqState{

}

class FriendAddErorState extends FriendreqState {
  String msg;
  FriendAddErorState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
