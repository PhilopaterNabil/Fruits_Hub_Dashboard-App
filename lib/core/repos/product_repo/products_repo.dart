import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(ProductEntity addProductInputEntity);
}
