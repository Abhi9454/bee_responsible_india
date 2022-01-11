import 'dart:developer';

import 'package:dio/dio.dart';

import '../config.dart';
import '../helpers/error_handler.dart';
import '../helpers/http_service.dart';

class RegisterService {
  final HttpService httpService = HttpService();

  Future<Map<String, dynamic>> register(
      String name,
      String email,
      String phoneNumber,
      String city,
      String state,
      String profession) async {
    try {
      final Map<String, dynamic> map = <String, dynamic>{
        'fullname': name,
        'emailid': email,
        'phonenumber': phoneNumber,
        'city': city,
        'state': state,
        'profession': profession,
      };
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/registration.php', 'POST',
          data: map);
      log(response.data.toString());
      return response.data as Map<String, dynamic>;
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.other) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}
