import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/fetch_orders_cubit/fetch_orders_cubit.dart';
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

  // OrdersRepo implementation and FetchOrdersCubit
  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(getIt<DatabaseService>()));
  getIt.registerFactory<FetchOrdersCubit>(() => FetchOrdersCubit(getIt<OrdersRepo>()));

  // UpdateOrderCubit
  getIt.registerFactory<UpdateOrderCubit>(() => UpdateOrderCubit(getIt<OrdersRepo>()));
}
