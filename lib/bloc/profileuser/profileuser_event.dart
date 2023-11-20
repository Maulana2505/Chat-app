import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileuserEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileuserLoadDataEvent extends ProfileuserEvent {}

class ProfileUpdateDataEvent extends ProfileuserEvent {
  String? username;
  File? img;
  ProfileUpdateDataEvent({required this.username,required this.img});
  @override
  // TODO: implement props 
  List<Object?> get props => [username,img];
}
