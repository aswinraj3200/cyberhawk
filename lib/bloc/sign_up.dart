import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtb1/repositories/repositories.dart';
import 'package:newtb1/ui/data/model/signup_model.dart';

class SignupBloc extends Bloc<SignupEvents, SignupStates> {
  SignupBloc() : super(SignupInitial()) {
    on<GetSignupevent>(getSignupevent);
  }

  Future<FutureOr<void>> getSignupevent(
      GetSignupevent event, Emitter<SignupStates> emit) async {
    emit(Loading());

    SignupModel signupModel;

    Map map = {
      "phone": event.username,
      "password": event.password,
      "role": event.role
    };
    print(map);
    signupModel =
        await Repository().signup(url: "/user/registration", data: map);

    if (signupModel.status == true) {
      emit(SignupSuccess());
    } else if (signupModel.status == false) {
      emit(SignupError(error: signupModel.msg));
    }
  }
}

class SignupEvents {}

class GetSignupevent extends SignupEvents {
  final String? username, password, role;

  GetSignupevent({this.username, this.password, this.role});
}

class SignupStates {}

class SignupInitial extends SignupStates {}

class Loading extends SignupStates {}

class SignupSuccess extends SignupStates {}

class SignupError extends SignupStates {
  final String? error;

  SignupError({this.error});
}
