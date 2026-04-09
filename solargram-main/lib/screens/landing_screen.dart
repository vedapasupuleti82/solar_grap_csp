import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme/app_colors.dart';
import '../widgets/premium_button.dart';
import '../widgets/benefit_card.dart';
import '../widgets/feature_card.dart';
import '../widgets/section_title.dart';
import '../widgets/savings_preview_card.dart';
import 'calculator_screen.dart';
import 'schemes_screen.dart';
import 'eligibility_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.wb_sunny_rounded, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'SolarGram',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 48),
            _buildBenefitsSection(context),
            const SizedBox(height: 48),
            _buildFeaturesSection(context),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SavingsPreviewCard(
                onCalculate: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CalculatorScreen()));
                },
              ).animate().fade(duration: 800.ms).slideY(begin: 0.3),
            ),
            const SizedBox(height: 48),
            _buildTestimonialsSection(context),
            const SizedBox(height: 48),
            _buildBottomCTABanner(context),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '🇮🇳 India\'s #1 Solar App',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Switch to Solar.\nSave Money.',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 40,
                          height: 1.1,
                        ),
                  ).animate().fade(duration: 800.ms).slideY(begin: 0.2),
                  const SizedBox(height: 16),
                  Text(
                    'Reduce your electricity bill up to 90% and claim ₹78,000 in subsidies',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 16,
                          height: 1.5,
                        ),
                  ).animate().fade(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const CalculatorScreen()));
                        },
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Check Your Savings',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: AppColors.primaryDark,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded, color: AppColors.primaryDark),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).animate().fade(delay: 400.ms, duration: 800.ms).scale(curve: Curves.easeOutBack),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'See how it works ↓',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                    ).animate().fade(delay: 600.ms),
                  ),
                ],
              ),
            ),
            
            // Stat Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('10K+', 'Homes'),
                  Container(width: 1, height: 24, color: Colors.white.withValues(alpha: 0.3)),
                  _buildStatItem('₹2Cr', 'Saved'),
                  Container(width: 1, height: 24, color: Colors.white.withValues(alpha: 0.3)),
                  _buildStatItem('4.8★', 'Rating'),
                ],
              ),
            ).animate().fade(delay: 800.ms, duration: 800.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBenefitsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Why Go Solar?').animate().fade(duration: 800.ms),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: const BenefitCard(
                  icon: Icons.account_balance_wallet_rounded,
                  title: 'Save Money',
                  description: 'Cut bills by up to 90% every month',
                ).animate().fade(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: const BenefitCard(
                  icon: Icons.electrical_services_rounded,
                  title: 'No Power Cuts',
                  description: '24/7 power with battery backup',
                ).animate().fade(delay: 300.ms, duration: 800.ms).slideY(begin: 0.2),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: const BenefitCard(
                  icon: Icons.eco_rounded,
                  title: 'Eco Friendly',
                  description: 'Reduce 1.5 tons of CO₂ per year',
                ).animate().fade(delay: 400.ms, duration: 800.ms).slideY(begin: 0.2),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: const BenefitCard(
                  icon: Icons.trending_up_rounded,
                  title: 'Long-term ROI',
                  description: '10x returns over 25 years',
                ).animate().fade(delay: 500.ms, duration: 800.ms).slideY(begin: 0.2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Everything You Need').animate().fade(duration: 800.ms),
          const SizedBox(height: 24),
          FeatureCard(
            icon: Icons.calculate_rounded,
            title: 'Savings Calculator',
            description: 'Enter your bill, get instant savings estimate.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CalculatorScreen())),
          ).animate().fade(delay: 200.ms, duration: 800.ms).slideX(begin: 0.2),
          FeatureCard(
            icon: Icons.account_balance_rounded,
            title: 'Govt Schemes',
            description: 'Explore PM Surya Ghar & state subsidies.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SchemesScreen())),
          ).animate().fade(delay: 300.ms, duration: 800.ms).slideX(begin: 0.2),
          FeatureCard(
            icon: Icons.fact_check_rounded,
            title: 'Eligibility Check',
            description: 'See if you qualify in 30 seconds.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EligibilityScreen())),
          ).animate().fade(delay: 400.ms, duration: 800.ms).slideX(begin: 0.2),
          FeatureCard(
            icon: Icons.wb_sunny_rounded,
            title: 'Solar Recommendation',
            description: 'Get a custom system size for your home.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CalculatorScreen())),
          ).animate().fade(delay: 500.ms, duration: 800.ms).slideX(begin: 0.2),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SectionTitle(title: 'What People Say'),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildTestimonialCard('Rajesh K.', 'Hyderabad', 'Halved my bills immediately. Incredible support.'),
              _buildTestimonialCard('Priya M.', 'Bangalore', 'The govt subsidy process was totally hands-off. Love it.'),
              _buildTestimonialCard('Anil D.', 'Pune', 'Best investment for our home. The calculator was 100% accurate.'),
            ],
          ),
        ),
      ],
    ).animate().fade(duration: 800.ms).slideY(begin: 0.2);
  }

  Widget _buildTestimonialCard(String name, String city, String quote) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
            children: [
              CircleAvatar(
                backgroundColor: AppColors.accent,
                child: Text(name[0], style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(city, style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
              const Spacer(),
              Row(
                children: List.generate(5, (_) => const Icon(Icons.star_rounded, color: Colors.amber, size: 16)),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text('"$quote"', style: const TextStyle(fontStyle: FontStyle.italic, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildBottomCTABanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [AppShadows.primaryShadow],
        ),
        child: Column(
          children: [
            Text(
              'Ready to go solar?',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Join 10,000+ families saving with SolarGram',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white.withValues(alpha: 0.9)),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    // Navigate to register/install
                  },
                  child: Center(
                    child: Text(
                      'Get Started Free',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animate().fade(duration: 800.ms).slideY(begin: 0.2),
    );
  }
}
