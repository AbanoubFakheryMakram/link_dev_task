
import 'package:flutter/material.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:link_dev_task/views/widgets/error_text.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var pageProvider = Provider.of<PageProvider>(context, listen: false);
        pageProvider.setPage(pageProvider.lastPage);
        return false;
      },
      child: Center(
        child: ErrorText(errorMsg: 'There are no items available to be displayed'),
      ),
    );
  }
}
