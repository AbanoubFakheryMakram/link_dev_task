import 'package:flutter/material.dart';
import 'package:link_dev_task/core/enums/articles_states.dart';
import 'package:link_dev_task/core/utils/app_utils.dart';
import 'package:link_dev_task/view_models/articles_view_model.dart';
import 'package:link_dev_task/views/pages/articles/articles_list_widget.dart';
import 'package:link_dev_task/views/pages/articles/articles_loading_widget.dart';
import 'package:link_dev_task/views/widgets/error_text.dart';
import 'package:provider/provider.dart';

class ArticlesListPage extends StatefulWidget {
  const ArticlesListPage({Key key}) : super(key: key);

  @override
  _ArticlesListPageState createState() => _ArticlesListPageState();
}

class _ArticlesListPageState extends State<ArticlesListPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ArticlesViewModel>(context, listen: false).getArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesViewModel>(
      builder: (context, articlesProvider, child) {
        if(articlesProvider.articlesStates == ArticlesStates.LOADING) {
          return ArticlesLoadingWidget();
        } else if(articlesProvider.articlesStates == ArticlesStates.FAILED) {
          return Center(
            child: ErrorText(errorMsg: AppUtils.buildErrorMsg(articlesProvider.failure),),
          );
        } else {
          return ArticlesListWidget(
            articlesLis: articlesProvider.articles,
          );
        }
      },
    );
  }
}
