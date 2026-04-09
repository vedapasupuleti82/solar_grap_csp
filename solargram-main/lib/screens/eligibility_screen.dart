import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme/app_colors.dart';
import '../models/eligibility_model.dart';
import '../data/solar_data.dart';
import '../widgets/premium_button.dart';

class EligibilityScreen extends StatefulWidget {
  final bool isBottomNav;
  const EligibilityScreen({super.key, this.isBottomNav = false});

  @override
  State<EligibilityScreen> createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  EligibilityCategory? _selectedCategory;
  bool _showResult = false;

  void _checkEligibility() {
    if (_selectedCategory == null) return;
    setState(() => _showResult = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isBottomNav ? AppBar(title: const Text('Check Eligibility')) : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Check Eligibility'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSelectionCard(),
            const SizedBox(height: 32),
            if (_showResult && _selectedCategory != null) _buildResultView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Your Profile Category', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          ...SolarData.allCategories.map((category) {
            final isSelected = _selectedCategory?.id == category.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() {
                    _selectedCategory = category;
                    _showResult = false;
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.textSecondary.withValues(alpha: 0.2),
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? AppColors.accent : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_unchecked_rounded,
                          color: isSelected ? AppColors.primary : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            category.label,
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? AppColors.primaryDark : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (category.priority != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(8)),
                            child: const Text('PRIORITY', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          PremiumButton(
            text: 'Check My Eligibility',
            onPressed: _checkEligibility,
          ),
        ],
      ),
    ).animate().fade().slideY(begin: 0.1);
  }

  Widget _buildResultView() {
    final cat = _selectedCategory!;
    
    // Simulate finding documents (Using hardcoded strings or we can match via label)
    // The prompt map uses string matching for document categories.
    // For simplicity, we just show a few fixed docs based on category if complex logic needed.
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [AppShadows.primaryShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: Colors.white, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You are Eligible!',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Based on your profile as ${cat.label}, you can apply for the following schemes:',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),
              ...cat.schemes.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                    const SizedBox(width: 8),
                    Expanded(child: Text(s, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                  ],
                ),
              )),
              const Divider(color: Colors.white24, height: 32),
              Text('Maximum Available Subsidy', style: TextStyle(color: Colors.white.withValues(alpha: 0.8))),
              Text(cat.maxSubsidy, style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 28)),
              if (cat.consumerPays != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                  child: Text('You pay: ${cat.consumerPays}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ]
            ],
          ),
        ).animate().fade().scale(begin: const Offset(0.9, 0.9)),
        
        const SizedBox(height: 32),
        Text('Basic Requirements', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        ...cat.eligibleIf.map((req) => _buildRequirementRow(req)),
        
        const SizedBox(height: 32),
        Text('Documents Checklist', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        _buildDocumentChecklist(cat),
      ],
    );
  }

  Widget _buildRequirementRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_rounded, color: AppColors.success, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }

  Widget _buildDocumentChecklist(EligibilityCategory cat) {
    List<String> docs = [
      'Aadhaar Card (Linked to Mobile)',
      'Latest Electricity Bill',
      'Property/Roof Ownership Proof',
      'Bank Account Details (Aadhaar linked)',
      'Passport Size Photo (2 Copies)',
    ];
    
    if (cat.documentsExtra != null) docs.addAll(cat.documentsExtra!);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: docs.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.description_outlined, color: AppColors.primary),
            title: Text(docs[index], style: const TextStyle(fontSize: 14)),
            trailing: const Icon(Icons.check_box_outline_blank_rounded, color: AppColors.textSecondary),
          );
        },
      ),
    );
  }
}
