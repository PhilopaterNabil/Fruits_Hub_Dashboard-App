import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failures, void>> addProduct(ProductEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsCollection,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
        documentId: addProductInputEntity.code,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product: ${e.toString()}'));
    }
  }
}
