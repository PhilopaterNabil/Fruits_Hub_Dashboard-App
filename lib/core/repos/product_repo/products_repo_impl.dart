import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failures, void>> addProduct(AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
        documentId: addProductInputEntity.code,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product: ${e.toString()}'));
    }
  }
}
