import '../services/login_service.dart';
import 'package:flutter/cupertino.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';


class LoginPageViewModel extends ChangeNotifier {
  final AuthenticateService _authenticateService = AuthenticateService();
  LoginStatus _loginStatus = LoginStatus.pending;

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    _userDetails = userDetails;
    if(_userDetails['success'] == 0){
      _loginStatus = LoginStatus.failed;
    }
    else{
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

  login(String email, String password) async {
    try {
      _loginStatus = LoginStatus.loading;
      notifyListeners();
      _setUserDetails(await _authenticateService.login(email, password));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}