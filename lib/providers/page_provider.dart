
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/enums/pages_enum.dart';
import 'package:link_dev_task/views/pages/articles/articles_list_page.dart';
import 'package:link_dev_task/views/pages/explore_online_news/explore_online_news_page.dart';
import 'package:link_dev_task/views/pages/gallery/gallery_page.dart';
import 'package:link_dev_task/views/pages/live_chat/live_chat_page.dart';
import 'package:link_dev_task/views/pages/wish_list/wish_list_page.dart';

class PageProvider with ChangeNotifier {

  Pages _currentPage = Pages.ARTICLES;
  Pages _lastPage = Pages.ARTICLES;

  Pages get currentPage => _currentPage;
  Pages get lastPage => _lastPage;

  void setPage(Pages page) {
    if(_lastPage == _currentPage) {
      _currentPage = Pages.ARTICLES;
    }
    _lastPage = _currentPage;
    _currentPage = page;
    notifyListeners();
  }

  Widget getPage() {
    switch (_currentPage) {
      case Pages.ARTICLES:
        return ArticlesListPage();
        break;
      case Pages.LIVE_CHAT:
        return LiveChatPage();
        break;
      case Pages.GALLERY:
        return GalleryPage();
        break;
      case Pages.WISH_LIST:
        return WishListPage();
        break;
      case Pages.EXPLORE_ONLINE_NEWS:
        return ExploreOnlineNewsPage();
        break;
      default:
        return ArticlesListPage();
        break;
    }
  }
}