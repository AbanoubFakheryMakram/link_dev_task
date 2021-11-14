
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/consts/colors.dart';
import 'package:link_dev_task/core/enums/pages_enum.dart';
import 'package:link_dev_task/core/utils/app_utils.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:provider/provider.dart';
import '../../core/extentions/string_extensions.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  List<DrawerItemModel> drawerItems = [];
  List<String> itemsImages = [
    'assets/images/articles_img.png',
    'assets/images/live_chat_img.png',
    'assets/images/gallery_img.png',
    'assets/images/wish_list_img.png',
    'assets/images/explore_online_img.png',
  ];

  @override
  void initState() {
    super.initState();

    drawerItems = getItems();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) => Drawer(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: query.padding.top,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: Image.asset('assets/images/user_img.png').image,
                  ),
                  title: Text('Welcome', style: TextStyle(color: AppColors.lightGrayColor, fontSize: 12),),
                  subtitle: Text('Tony Roshdy', style: TextStyle(fontSize: 17, color: Colors.black87),),
                ),
                SizedBox(height: 25,),
                for (int i = 0; i < drawerItems.length; i++)
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pageProvider.setPage(drawerItems[i].page);
                    },
                    leading: Image.asset(drawerItems[i].img, scale: 2,),
                    title: Text(AppUtils.enumToString(drawerItems[i].page).capitalizeFirstLiter()),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DrawerItemModel> getItems() {
    List<DrawerItemModel> items = [];
    for (int i = 0; i < Pages.values.length; i++) {
      try {
        items.add(DrawerItemModel(Pages.values[i], itemsImages[i]));
      } catch (e) {
        // case the pages count is greater than the images count or vice versa
        return items;
      }
    }

    return items;
  }
}

class DrawerItemModel {
  Pages page;
  String img;

  DrawerItemModel(this.page, this.img);
}
