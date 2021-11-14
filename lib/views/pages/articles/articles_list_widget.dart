
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/consts/colors.dart';
import 'package:link_dev_task/models/responses/articles_response.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:link_dev_task/view_models/articles_view_model.dart';
import 'package:link_dev_task/views/pages/articles/article_details_page.dart';
import 'package:provider/provider.dart';

class ArticlesListWidget extends StatelessWidget {

  final List<Articles> articlesLis;
  const ArticlesListWidget({Key key, @required this.articlesLis}) : assert(articlesLis != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) => Consumer<ArticlesViewModel>(
        builder: (context, articlesViewModelProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: articlesLis.length,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 20,);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    articlesViewModelProvider.selectedArticle = articlesLis[index];
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ArticlesDetailsPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 270,
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Hero(
                              tag: articlesLis[index].title ?? '',
                              child: CachedNetworkImage(
                                progressIndicatorBuilder: (_, __, ___) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                                    ),
                                  );
                                },
                                width: double.infinity,
                                imageUrl: articlesLis[index].urlToImage,
                                fit: BoxFit.fill,
                                errorWidget: (_, __, ___) {
                                  return Container(
                                    color: AppColors.lightGrayColor,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(articlesLis[index].title ?? '', style: TextStyle(fontSize: 16, color: Color(0xff777777)),),
                                SizedBox(height: 10,),
                                Text(articlesLis[index].author ?? '', style: TextStyle(fontSize: 13, color: AppColors.lightGrayColor),),
                                SizedBox(height: 10,),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(articlesLis[index].publishedAt, style: TextStyle(fontSize: 13, color: AppColors.lightGrayColor),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              addAutomaticKeepAlives: true,
            ),
          );
        },
      ),
    );
  }
}

