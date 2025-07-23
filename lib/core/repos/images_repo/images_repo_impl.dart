import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String imageUrl = await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image: ${e.toString()}'));
    }
  }
}
