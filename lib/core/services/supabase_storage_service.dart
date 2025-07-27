import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static  initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
