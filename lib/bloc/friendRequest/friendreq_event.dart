// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

abstract class FriendreqEvent extends Equatable {
}

class FriendreqLoadDataEvent extends FriendreqEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FriendaccEvent extends FriendreqEvent {
  String id;
  FriendaccEvent({
    required this.id,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class FriendAddEvent extends FriendreqEvent {
  String id;
  FriendAddEvent({
    required this.id,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

