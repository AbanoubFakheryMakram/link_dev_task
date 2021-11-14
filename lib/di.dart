
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:link_dev_task/core/network/base_abstract_repo.dart';
import 'package:link_dev_task/core/network/base_abstract_repo_impl.dart';
import 'package:link_dev_task/view_models/articles_view_model.dart';

import 'core/network/base_api_provider.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // shared
  sl.registerLazySingleton(() => BaseApiProvider(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // view general_models
  sl.registerLazySingleton(() => ArticlesViewModel(sl()));

  // repos
  sl.registerLazySingleton<BaseAbstractRepo>(() => BaseRepositoryImpl(apiProvider: sl()));
}