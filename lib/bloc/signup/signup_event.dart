

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable{}

class SignupDataEvent extends SignupEvent {
  late String email;
  late String username;
  late String password;
  SignupDataEvent({
    required this.email,
    required this.username,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [email,username,password];
}
