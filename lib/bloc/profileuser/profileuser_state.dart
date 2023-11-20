// ignore_for_file: must_be_immutable


import 'package:equatable/equatable.dart';

import '../../model/userSiggleModel/userSigglemodel.dart';

abstract class ProfileuserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileuserInitialState extends ProfileuserState {}

class ProfileuserLoadingDataState extends ProfileuserState{}

class ProfileuserLoadDataState extends ProfileuserState {
  userSigglemodel? user;
  ProfileuserLoadDataState({
    this.user,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class ProfileuserErrorState extends ProfileuserState {
  String msg;
  ProfileuserErrorState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class ProfileUpdateDataSuccesState extends ProfileuserState{
}

class ProfileUpdateDataFailedState extends ProfileuserState{
  String msg;
  ProfileUpdateDataFailedState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}