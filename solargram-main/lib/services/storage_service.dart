import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final _client = Supabase.instance.client;

  Future<String> uploadPostImage(File imageFile) async {
    final userId = _client.auth.currentUser!.id;
    final fileName = '$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';

    await _client.storage
        .from('solar-posts')
        .upload(fileName, imageFile,
            fileOptions: const FileOptions(
              contentType: 'image/jpeg',
              upsert: false,
            ));

    return _client.storage.from('solar-posts').getPublicUrl(fileName);
  }
}
