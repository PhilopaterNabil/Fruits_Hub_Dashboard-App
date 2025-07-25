import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(AddProductInputEntity addProductInputEntity);
}