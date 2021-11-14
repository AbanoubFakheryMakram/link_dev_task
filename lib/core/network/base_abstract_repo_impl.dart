
import 'package:dio/dio.dart';

import 'base_abstract_repo.dart';
import 'base_api_provider.dart';

class BaseRepositoryImpl implements BaseAbstractRepo {
  BaseApiProvider apiProvider;

  BaseRepositoryImpl({this.apiProvider}) {
    if (apiProvider == null) {
      this.apiProvider = BaseApiProvider(Dio());
    }
  }

  Future<Response> getRemote(String url) async {
    print('get from >>>>> $url');
    Response response = await apiProvider.generalGet(url);
    return response;
  }
}