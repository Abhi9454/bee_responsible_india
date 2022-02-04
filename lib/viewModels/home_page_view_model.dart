import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import '../models/chemical_model.dart';
import '../services/home_service.dart';

class HomePageViewModel extends ChangeNotifier {
  final HomePageService _homePageService = HomePageService();
  late SharedPreferences _sharedPreference;
  String searchText = '';

  HomePageUserStatus _userStatus = HomePageUserStatus.pendingVerification;

  HomePageUserStatus get userStatus => _userStatus;

  Status _status = Status.init;

  Status get status => _status;

  late List<ChemicalModel> _products;

  List<ChemicalModel> searchedProduct = [];

  List<ChemicalModel> get products => _products;

  Future<void> _setProducts(List<ChemicalModel> products) async {
    _products = products;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  init() async {
    _sharedPreference = await SharedPreferences.getInstance();
    if (_sharedPreference.containsKey('loginStatus')) {
      _userStatus = HomePageUserStatus.userVerified;
    }
    notifyListeners();
  }

  clearSearch() async{
    _status = Status.loading;
    searchedProduct.clear();
    _status = Status.success;
    notifyListeners();
  }

  searchItem(String value) {
    log(value);
    _status = Status.loading;
    searchText = value;
    searchedProduct.clear();
    for (int i = 0; i < products.length; i++) {
      if (products[i]
          .chemicalIngredients
          .toLowerCase().contains(searchText.toLowerCase()) || products[i]
          .chemicalGroup
          .toLowerCase().contains(searchText.toLowerCase()) || products[i]
          .chemicalName
          .toLowerCase().contains(searchText.toLowerCase())) {
        searchedProduct.add(products[i]);
        log(products[i].chemicalColor.toString());
      }
    }
    _status = Status.success;
    notifyListeners();
  }

  fetchProductList() async {
    try {
      _status = Status.loading;
      _setProducts(await _homePageService.fetchChemical());
      if(!_sharedPreference.containsKey('askLogin')){
        _sharedPreference.setInt('askLogin', 1);
      }
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
