import 'package:flutter/foundation.dart';
import 'package:link_dev_task/core/enums/articles_states.dart';
import 'package:link_dev_task/core/error/failure.dart';
import 'package:link_dev_task/core/network/network_info.dart';
import 'package:link_dev_task/models/responses/articles_response.dart';
import 'package:link_dev_task/services/remote_services/articles_remote_services.dart';

class ArticlesViewModel with ChangeNotifier {
  final NetworkInfo networkInfo;

  ArticlesViewModel(this.networkInfo);

  List<Articles> articles = <Articles>[];
  Articles selectedArticle;
  Failure failure;
  ArticlesStates articlesStates = ArticlesStates.LOADING;

  void getArticles() async {
    articlesStates = ArticlesStates.LOADING;
    var result = await WebService(this.networkInfo).getArticles();
    result.fold((left) {
      failure = left;
      articlesStates = ArticlesStates.FAILED;
    }, (right) {
      articles = right;
      articlesStates = ArticlesStates.SUCCESS;
    });

    notifyListeners();
  }
}
