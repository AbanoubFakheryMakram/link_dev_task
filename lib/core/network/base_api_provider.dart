
import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/app_utils.dart';
import '../error/exceptions.dart';

class BaseApiProvider {
  Dio dio;

  BaseApiProvider(this.dio);

  Options options() => Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers: {
      'content-type': 'application/json',
    },
  );

  Future<Response> generalGet(String url) async {
    try {
      Response response = await dio.get(
        url,
        options: options(),
      );
      return AppUtils.handleStatuesCodeResponse(response);
    } on SocketException catch (e) {
      throw NoInternetConnectionException();
    } on DioError catch (e) {
      return AppUtils.handleDioError(e);
    }
  }
}