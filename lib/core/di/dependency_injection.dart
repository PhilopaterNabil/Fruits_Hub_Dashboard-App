import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/add_product/add_product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = DioFactory.getDio();
  // final dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // // firebase storage service
  // getIt.registerLazySingleton<StorageService>(() => FireStorage());

  // supabase storage service
  getIt.registerLazySingleton<StorageService>(() => SupabaseStorageService());
  // database service
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());

  // ImagesRepo implementation
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));

  /// Registering the ProductsRepo and AddProductCubit
  // ProductsRepo implementation
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt<DatabaseService>()));
  // AddProduct Cubit
  getIt.registerFactory<AddProductCubit>(() => AddProductCubit(
        getIt<ImagesRepo>(),
        getIt<ProductsRepo>(),
      ));
}
