import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import '../services/registration_service.dart';

class RegisterPageViewModel extends ChangeNotifier {
  final RegisterService _registerService = RegisterService();
  RegisterStatus _registerStatus = RegisterStatus.pending;
  late String registerErrorMessage;

  RegisterStatus get registerStatus => _registerStatus;

  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userDetails = userDetails;
    if (_userDetails['success'] == 0) {
      _registerStatus = RegisterStatus.failed;
      registerErrorMessage = _userDetails['message'];
      log(_userDetails.toString());
    } else {
      sharedPreferences.setInt('loginStatus', 1);
      _registerStatus = RegisterStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  register(String name, String email, String mobileNumber, String city,
      String state, String profession) async {
    try {
      _registerStatus = RegisterStatus.loading;
      notifyListeners();
      _setUserDetails(await _registerService.register(
          name, email, mobileNumber, city, state, profession));
    } on ShowError catch (error) {
      _registerStatus = RegisterStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
