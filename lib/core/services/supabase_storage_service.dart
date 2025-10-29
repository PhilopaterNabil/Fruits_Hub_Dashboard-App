import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
// path package is not needed here after refactor; file_name_utils handles path parsing
import 'package:fruits_hub_dashboard/core/utils/file_name_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    bool isBucketExists = false;
    await _supabase.client.storage.listBuckets().then((buckets) {
      if (buckets.any((bucket) => bucket.name == bucketName)) {
        isBucketExists = true;
        return; // Bucket already exists
      }
    });

    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    // Build a sanitized, unique object name and upload.
    final String objectName = buildUniqueObjectName(path, file.path);

    // Upload file to the bucket (unique name prevents 409 conflict).
    await _supabase.client.storage.from(kFruitsImagesBucket).upload(objectName, file);

    // Return the percent-encoded public URL for the uploaded object.
    final String downloadUrl =
        _supabase.client.storage.from(kFruitsImagesBucket).getPublicUrl(objectName);

    return Uri.encodeFull(downloadUrl);
  }
}
