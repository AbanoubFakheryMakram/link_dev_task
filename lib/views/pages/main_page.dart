
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/utils/app_utils.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:link_dev_task/views/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pagerProvider, child) => Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text(AppUtils.enumToString(pagerProvider.currentPage).toUpperCase()),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: pagerProvider.getPage(),
      ),
    );
  }
}

