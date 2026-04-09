import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import '../core/theme/app_colors.dart';

class SolarPostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  const SolarPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final profile = post['profiles'];
    final name = profile != null ? profile['name'] ?? 'User' : 'Solar User';
    final village = profile != null ? profile['village'] ?? post['village'] : post['village'] ?? 'Local Village';
    final kwp = post['kwp'] ?? 3.0;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(name, village, kwp.toString()),
          if (post['image_url'] != null)
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: post['image_url'],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 250,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 250,
                  color: AppColors.cardBg,
                  child: const Icon(Icons.broken_image, color: AppColors.textSecondary, size: 40),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post['caption'] != null)
                  Text(
                    post['caption'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                const Gap(12),
                Row(
                  children: [
                    const Icon(Icons.favorite_rounded, color: AppColors.error, size: 24),
                    const Gap(8),
                    Text('${post['likes'] ?? 0} likes', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const Icon(Icons.share_rounded, color: AppColors.textSecondary, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fade().slideY(begin: 0.1);
  }

  Widget _buildHeader(String name, String village, String kwp) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accent,
            child: const Icon(Icons.person_rounded, color: AppColors.primaryDark),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, size: 12, color: AppColors.primary),
                    const Gap(4),
                    Text(village, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$kwp kWp',
              style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
