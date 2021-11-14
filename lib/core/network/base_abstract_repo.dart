
import 'package:dio/dio.dart';

abstract class BaseAbstractRepo {

  Future<Response> getRemote(String url);
}