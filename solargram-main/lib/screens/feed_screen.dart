import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_colors.dart';
import '../services/solargram_service.dart';
import '../widgets/solar_post_card.dart';
import '../widgets/premium_button.dart';

class FeedScreen extends StatefulWidget {
  final bool isBottomNav;
  const FeedScreen({super.key, this.isBottomNav = false});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, dynamic>> _posts = [];
  RealtimeChannel? _channel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialPosts();
    _subscribeToNewPosts();
  }

  Future<void> _loadInitialPosts() async {
    try {
      final data = await SolargramService().getFeed();
      setState(() {
        _posts.addAll(data);
        _isLoading = false;
      });
    } catch (e) {
      // Offline fallback or fresh DB mock
      setState(() {
        _isLoading = false;
        _posts.addAll([
          {
            'image_url': 'https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?w=800&q=80',
            'caption': 'Switched to 3kW Solar today! ☀️ Electricity bill will finally be ZERO next month. Thanks to PM Surya Ghar scheme.',
            'village': 'Chandpur, UP',
            'kwp': 3.0,
            'likes': 42,
            'profiles': {'name': 'Ramesh Kumar'}
          },
          {
            'image_url': 'https://images.unsplash.com/photo-1613665813446-82a78c468a1d?w=800&q=80',
            'caption': 'Our village microgrid is up and running. 10 houses powered entirely by the sun. #SolarIndia',
            'village': 'Andur, Maharashtra',
            'kwp': 15.0,
            'likes': 108,
            'profiles': {'name': 'Gram Panchayat Andur'}
          }
        ]);
      });
    }
  }

  void _subscribeToNewPosts() {
    try {
      _channel = Supabase.instance.client
          .channel('solar_posts')
          .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'solar_posts',
            callback: (payload) {
              setState(() => _posts.insert(0, payload.newRecord));
            },
          )
          .subscribe();
    } catch (e) {
      // Ignore if Supabase is not fully initialized with keys yet
    }
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isBottomNav ? AppBar(title: const Text('Community Feed')) : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Community Feed'),
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: _posts.length,
            itemBuilder: (context, i) => SolarPostCard(post: _posts[i]),
          ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_a_photo_rounded, color: Colors.white),
        label: const Text('New Post', style: TextStyle(color: Colors.white)),
        onPressed: () {
          // TODO: Open PostScreen
        },
      ),
    );
  }
}
