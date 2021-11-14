
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:link_dev_task/core/network/api_routes.dart';
import 'package:link_dev_task/core/utils/app_utils.dart';
import 'package:link_dev_task/core/network/base_abstract_repo_impl.dart';
import 'package:link_dev_task/core/error/failure.dart';
import 'package:link_dev_task/core/network/network_info.dart';
import 'package:link_dev_task/models/responses/articles_response.dart';

class WebService extends BaseRepositoryImpl {

  final NetworkInfo networkInfo;

  WebService(this.networkInfo);

  Future<Either<Failure, List<Articles>>> getArticles() async {
    if (await networkInfo.isConnected) {
      try {
        var response = await Future.wait([
          getRemote(ApiRoutes.getTheNextWebNews()),
          getRemote(ApiRoutes.getAssociatedPressNews()),
        ]);

        return Right(<Articles>[
          ..._getArticlesFromResponse(response[0]),
          ..._getArticlesFromResponse(response[1]),
        ]);

      } catch (e) {
        return Left(AppUtils.buildFailure(e));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  List<Articles> _getArticlesFromResponse(Response response) {
    return [
        for (var i in response.data['articles']) Articles.fromJson(i),
    ];
  }
}