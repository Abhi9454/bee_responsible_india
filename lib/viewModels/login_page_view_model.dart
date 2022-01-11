import '../services/login_service.dart';
import 'package:flutter/cupertino.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPageViewModel extends ChangeNotifier {
  final AuthenticateService _authenticateService = AuthenticateService();
  LoginStatus _loginStatus = LoginStatus.pending;
  late SharedPreferences preferences;

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    preferences = await SharedPreferences.getInstance();
    _userDetails = userDetails;
    if(_userDetails['success'] == 0){
      _loginStatus = LoginStatus.failed;
    }
    else{
      preferences.setInt('loginStatus', 1);
      _loginStatus = LoginStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  login(String phoneNumber) async {
    try {
      _loginStatus = LoginStatus.loading;
      notifyListeners();
      _setUserDetails(await _authenticateService.login(phoneNumber));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}