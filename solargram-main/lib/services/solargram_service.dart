import 'package:supabase_flutter/supabase_flutter.dart';

class SolargramService {
  final _client = Supabase.instance.client;

  Future<void> createPost({
    required String imageUrl,
    required String caption,
    required String village,
    required double kwp,
  }) async {
    await _client.from('solar_posts').insert({
      'user_id': _client.auth.currentUser!.id,
      'image_url': imageUrl,
      'caption': caption,
      'village': village,
      'kwp': kwp,
    });
  }

  Future<List<Map<String, dynamic>>> getFeed({int page = 0}) async {
    return await _client
        .from('solar_posts')
        .select('*, profiles(name, village)')
        .order('created_at', ascending: false)
        .range(page * 10, page * 10 + 9);
  }

  Future<void> logReading(double kwh) async {
    await _client.from('solar_readings').insert({
      'user_id': _client.auth.currentUser!.id,
      'kwh_generated': kwh,
    });
  }

  Future<List<Map<String, dynamic>>> getMyReadings() async {
    return await _client
        .from('solar_readings')
        .select()
        .eq('user_id', _client.auth.currentUser!.id)
        .gte('date', DateTime.now().subtract(const Duration(days: 30)).toIso8601String())
        .order('date');
  }

  Future<List<Map<String, dynamic>>> getSchemes(String state) async {
    return await _client
        .from('schemes')
        .select()
        .eq('active', true)
        .or('state.eq.$state,state.eq.all');
  }
}
