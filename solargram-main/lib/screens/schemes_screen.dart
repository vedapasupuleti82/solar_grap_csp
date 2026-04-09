import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme/app_colors.dart';
import '../data/solar_data.dart';
import '../models/scheme_model.dart';

import 'package:url_launcher/url_launcher.dart';

class SchemesScreen extends StatefulWidget {
  final bool isBottomNav;
  const SchemesScreen({super.key, this.isBottomNav = false});

  @override
  State<SchemesScreen> createState() => _SchemesScreenState();
}

class _SchemesScreenState extends State<SchemesScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Central', 'State'];

  List<SchemeModel> get _filteredSchemes {
    if (_selectedFilterIndex == 1) {
      return SolarData.allSchemes.where((s) => s.category == SchemeCategory.central).toList();
    } else if (_selectedFilterIndex == 2) {
      return SolarData.allSchemes.where((s) => s.category == SchemeCategory.state).toList();
    }
    return SolarData.allSchemes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isBottomNav ? AppBar(title: const Text('Government Schemes')) : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Government Schemes'),
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _filteredSchemes.length,
              itemBuilder: (context, index) {
                final scheme = _filteredSchemes[index];
                return _buildSchemeCard(scheme, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilterIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(_filters[index]),
              selected: isSelected,
              onSelected: (val) {
                setState(() => _selectedFilterIndex = index);
              },
              backgroundColor: AppColors.cardBg,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              side: const BorderSide(color: Colors.transparent),
              elevation: isSelected ? 4 : 0,
              shadowColor: AppColors.primary.withValues(alpha: 0.4),
            ),
          );
        }),
      ).animate().fade().slideX(begin: 0.1),
    );
  }

  Widget _buildSchemeCard(SchemeModel scheme, int index) {
    final isCentral = scheme.category == SchemeCategory.central;
    String typeBadge = isCentral ? 'Central Govt.' : '${scheme.state} State';
    
    String subsidyStr = 'View Details';
    if (scheme.subsidySlabs != null && scheme.subsidySlabs!.isNotEmpty) {
      subsidyStr = 'Up to ${scheme.subsidySlabs!.last.totalSubsidy ?? scheme.subsidySlabs!.first.subsidyPerKw}';
    } else if (scheme.categorySubsidies != null) {
      subsidyStr = 'Up to 95% Subsidy';
    } else if (scheme.subsidyStructure != null) {
      subsidyStr = scheme.subsidyStructure!.first.stateAdditional ?? 'State Top-up';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  scheme.fullName ?? scheme.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(typeBadge, style: const TextStyle(color: AppColors.primaryDark, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  subsidyStr,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              if (scheme.targetDeadline != null)
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 14, color: AppColors.error),
                    const SizedBox(width: 4),
                    Text(scheme.targetDeadline!, style: const TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Text('Eligibility', style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 4),
          Text(scheme.eligibility?.residential ?? scheme.eligibility?.primaryBeneficiary ?? 'Indian citizens & property owners', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () async {
                final url = scheme.applyPortal ?? scheme.officialPortal;
                if (url != null) {
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Apply Now', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ).animate().fade(delay: (100 * index).ms).slideY(begin: 0.1);
  }
}
