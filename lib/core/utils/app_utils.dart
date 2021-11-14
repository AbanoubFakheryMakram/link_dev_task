
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:link_dev_task/core/enums/pages_enum.dart';
import '../error/exceptions.dart';
import '../error/failure.dart';

class AppUtils {

  static String buildErrorMsg(Failure failure) {
    log('failure: $failure');
    if(failure is NoInternetConnectionFailure) return 'No Internet Connection';
    else if(failure is InternalServerErrorFailure) return 'Internal Server Error';
    else if(failure is UnauthorizedFailure) return 'Not Authorized';
    else if(failure is NotFoundFailure) return 'Not Found';
    else if(failure is MethodNotAllowedFailure) return 'Method Not Allowed';
    else if(failure is ConnectionTimeoutFailure) return 'Connection Timeout';
    else if(failure is BadRequestFailure) return 'Bad Request';
    else if(failure is MyHttpFailure) return 'Http Exception';
    else if(failure is MyFormatFailure) return 'Format Exception';
    else return 'Unknown Exception';
  }

  static Failure buildFailure(dynamic e) {
    print('----> $e');

    if(e is NotFoundException) {
      return NotFoundFailure();
    } else if(e is InternalServerErrorException) {
      return InternalServerErrorFailure();
    } else if(e is BadRequestException) {
      return BadRequestFailure();
    } else if(e is UnauthorizedException) {
      return UnauthorizedFailure();
    } else if(e is MethodNotAllowedException) {
      return MethodNotAllowedFailure();
    } else if(e is ConnectionTimeoutException) {
      return ConnectionTimeoutFailure();
    } else {
      return UnknownFailure();
    }
  }

  static dynamic handleDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.response:
      case DioErrorType.other:
      case DioErrorType.cancel:
        handleStatuesCodeResponse(dioError.response);
        break;
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        throw ConnectionTimeoutException();
    }
  }

  static dynamic handleStatuesCodeResponse(Response response) {
    if(response == null) {
      throw UnknownException();
    } else {
      switch (response.statusCode) {
        case 200:
        case 201:
          return response;
        case 500:
          throw InternalServerErrorException();
        case 400:
          throw BadRequestException();
        case 401:
        case 403:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException();
        case 405:
          throw MethodNotAllowedException();
        case 408:
          return ConnectionTimeoutException();
        default:
          throw NoInternetConnectionException();
      }
    }
  }

  static String enumToString(Pages page) {
    return EnumToString.convertToString(page, camelCase: true);
  }
}