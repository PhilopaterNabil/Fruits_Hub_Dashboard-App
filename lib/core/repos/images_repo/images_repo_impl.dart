import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      // Simulate image upload logic
      String imageUrl = 'https://example.com/${image.path.split('/').last}';
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}