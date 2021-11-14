import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/consts/colors.dart';
import 'package:link_dev_task/di.dart';
import 'package:link_dev_task/providers/page_provider.dart';
import 'package:provider/provider.dart';

import 'view_models/articles_view_model.dart';
import 'views/pages/main_page.dart';

void main() async {

  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MyApp());
  await initDI();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesViewModel(sl())),
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MaterialApp(
        title: 'Link-Dev-Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.mainColor,
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        home: MainPage(),
      ),
    );
  }
}
