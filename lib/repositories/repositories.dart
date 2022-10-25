import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtb1/ui/data/model/login_model.dart';
import 'package:newtb1/ui/data/model/signup_model.dart';

import 'package:newtb1/ui/data/web_client.dart';

class Repository {
  Future<LoginModel> checkPhoneNumber(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel userModel = LoginModel.fromJson(response);
    return userModel;
  }

  Future<GenerateOtpModel> generateOtp(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final GenerateOtpModel generateOtpModel =
        GenerateOtpModel.fromJson(response);
    return generateOtpModel;
  }

  Future<LoginModel> loginWithOtp({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }
  Future<SignupModel> signup(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",

        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final SignupModel userModel = SignupModel.fromJson(response);
    return userModel;
  }

 
}