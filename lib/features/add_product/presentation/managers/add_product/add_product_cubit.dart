import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo) : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());

    var imageUploadResult = await imagesRepo.uploadImage(addProductInputEntity.image);
    imageUploadResult.fold(
      (failure) => emit(AddProductFailure(failure.message)),
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;

        var addProductResult = await productsRepo.addProduct(addProductInputEntity);
        emit(AddProductSuccess());
        addProductResult.fold(
          (failure) => emit(AddProductFailure(failure.message)),
          (success) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
