import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtb1/repositories/repositories.dart';
import 'package:newtb1/ui/data/model/login_model.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<VerifyPassword>(verifyPassword);
  }

  Future<FutureOr<void>> verifyPassword(
      VerifyPassword event, Emitter<LoginStates> emit) async {
    emit(Loading());
    await Future.delayed(Duration(seconds: 2));
    LoginModel loginModel;

    Map map = {"phone": event.username, "password": event.password};
    loginModel = await Repository().checkPhoneNumber(url: '/user/login', data: map);

    if (loginModel.status == true) {
      emit(LoginSuccess());
    } else if (loginModel.status == false) {
      emit(LoginError(error: "Invalid credentials"));
    }

    // if (event.name == "abc" && event.password == "123") {
    //   emit(LoginSuccess());
    // } else {
    //   emit(LoginError(error: "Invalid credentials"));
    // }
  }
}

class LoginEvents {}

class VerifyPassword extends LoginEvents {
  final String? username, password;

  VerifyPassword({this.username, this.password});
}

class LoginStates {}

class LoginInitial extends LoginStates {}

class Loading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginError extends LoginStates {
  final String? error;

  LoginError({this.error});
}