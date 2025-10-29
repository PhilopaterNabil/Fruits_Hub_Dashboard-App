import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
// path package is not needed here after refactor; file_name_utils handles path parsing
import 'package:fruits_hub_dashboard/core/utils/file_name_utils.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {
    // Build a sanitized, unique object name and get a reference.
    final String objectName = buildUniqueObjectName(path, file.path);
    final fileReference = storageReference.child(objectName);

    try {
      await fileReference.putFile(file);
      String downloadUrl = await fileReference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }
}
