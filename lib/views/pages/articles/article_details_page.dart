
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/consts/colors.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:link_dev_task/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetailsPage extends StatelessWidget {
  const ArticlesDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details'.toUpperCase()),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Consumer<PageProvider>(
        builder: (context, pageProvider, child) => Consumer<ArticlesViewModel>(
          builder: (context, articlesViewModelProvider, child) => Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: articlesViewModelProvider.selectedArticle.title ?? '',
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  height: 240,
                                  width: double.infinity,
                                  progressIndicatorBuilder: (_, __, ___) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                                      ),
                                    );
                                  },
                                  imageUrl: articlesViewModelProvider.selectedArticle.urlToImage,
                                  fit: BoxFit.fill,
                                  errorWidget: (_, __, ___) {
                                    return Container(
                                      color: AppColors.lightGrayColor,
                                    );
                                  },
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Text(articlesViewModelProvider.selectedArticle.publishedAt, style: TextStyle(fontSize: 13, color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(articlesViewModelProvider.selectedArticle.title ?? '', style: TextStyle(fontSize: 19, color: Color(0xff555555)),),
                                SizedBox(height: 10,),
                                Text(articlesViewModelProvider.selectedArticle.author ?? '', style: TextStyle(fontSize: 14, color: Colors.grey),),
                                SizedBox(height: 10,),
                                Text(articlesViewModelProvider.selectedArticle.description ?? '', style: TextStyle(fontSize: 14, color: Colors.grey),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    width: size.width,
                    color: Colors.black,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'OPEN WEBSITE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await launch(articlesViewModelProvider.selectedArticle.url);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Can not open the website')));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
