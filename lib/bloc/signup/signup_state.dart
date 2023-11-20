import 'package:equatable/equatable.dart';


abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccesState extends SignupState {}

class SignupErrorState extends SignupState {
  final String msg;
  SignupErrorState(this.msg);
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
