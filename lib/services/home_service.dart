import 'dart:developer';

import '../models/chemical_model.dart';
import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class HomePageService {
  final HttpService httpService = HttpService();

  Future<List<ChemicalModel>> fetchChemical() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          '${AppConfig().apiUrl}/chemical.php', 'POST');
      var json = response.data as Map<String,dynamic>;
      var res = json['data'] as List;
      log(res[0].toString());
      List<ChemicalModel> list = res.map<ChemicalModel>((json) => ChemicalModel.fromJson(json)).toList();
      return list;
    } on DioException catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectionTimeout) {
        throw ShowError('Server timeout ');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}