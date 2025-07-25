import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = DioFactory.getDio();
  // final dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // firebase storage service
  getIt.registerLazySingleton<StorageService>(() => FireStorage());
  // database service
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());

  // ImagesRepo implementation
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));

  // ProductsRepo implementation
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt<DatabaseService>()));
}
