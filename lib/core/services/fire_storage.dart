import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance;

  // TODO: Implement the uploadFile method to upload files to Firebase Storage
  @override
  Future<String> uploadFile(String file) async {
    // Simulate file upload logic
    await Future.delayed(Duration(seconds: 2));
    return 'https://example.com/$file';
  }
}
