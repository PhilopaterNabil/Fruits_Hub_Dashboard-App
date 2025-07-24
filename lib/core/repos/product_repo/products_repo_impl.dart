import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<Either<Failures, void>> addProduct(AddProductInputEntity addProductInputEntity) async {
    try {
      // Simulate adding product logic
      // In a real implementation, this would involve database operations
      // For example, saving the product to a Firestore collection
      return Right(null); // Return success
    } catch (e) {
      return Left(ServerFailure('Failed to add product: ${e.toString()}'));
    }
  }
}