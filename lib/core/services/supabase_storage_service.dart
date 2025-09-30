import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
import 'package:path/path.dart' as b;
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
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    var result = await _supabase.client.storage
        .from(kFruitsImagesBucket)
        .upload('$path/$fileName.$extensionName', file);

    final String downloadUrl = _supabase.client.storage
        .from(kFruitsImagesBucket)
        .getPublicUrl('$path/$fileName.$extensionName');

    return result;
  }
}
