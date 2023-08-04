import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AuthenticateService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> login(String phoneNumber) async {
    try {
      final Map<String, dynamic>  map = <String, dynamic>{
        'phonenumber' : phoneNumber,
      };
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/login.php', 'POST', data: map);
      return response.data as Map<String,dynamic>;
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