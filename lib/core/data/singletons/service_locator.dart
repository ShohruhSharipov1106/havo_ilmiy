import 'package:havo_ilmiy/core/data/singletons/dio_settings.dart';
import 'package:havo_ilmiy/core/data/singletons/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:havo_ilmiy/features/home/data/datasources/home_datasource.dart';
import 'package:havo_ilmiy/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:havo_ilmiy/features/pagination/data/repository/pagination.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());
  serviceLocator.registerLazySingleton(() => PaginationDatasource());
  serviceLocator.registerLazySingleton(
      () => HomeDatasourceImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(
      () => HomeRepoImpl(datasource: serviceLocator<HomeDatasourceImpl>()));
}
