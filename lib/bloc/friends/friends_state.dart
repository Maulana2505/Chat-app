
import 'package:equatable/equatable.dart';
import 'package:chat_app/model/friends/friends_model.dart';

abstract class FriendsState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FriendsInitialState extends FriendsState{}

class FriendsLoadingState extends FriendsState{}

class FriendsLoadDataState extends FriendsState{
  final List<Friend>? data;
  FriendsLoadDataState(this.data);
}

class FriendsErorrState extends FriendsState {
  String msg;
  FriendsErorrState({required this.msg});
}

class FriendsDeleteSuccesState extends FriendsState{

} 

class FriendsDeleteErorrState extends FriendsState{
  String msg;
  FriendsDeleteErorrState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}