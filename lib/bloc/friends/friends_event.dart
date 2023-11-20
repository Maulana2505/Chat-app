import 'package:equatable/equatable.dart';

abstract class FriendsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FriendsLoadDataEvent extends FriendsEvent{

}

class FriendsDeleteEvent extends FriendsEvent{
  String id;
  FriendsDeleteEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}