import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gap/gap.dart';
import '../core/theme/app_colors.dart';
import 'premium_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SavingsPreviewCard extends StatelessWidget {
  final VoidCallback onCalculate;

  const SavingsPreviewCard({super.key, required this.onCalculate});

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_IN', // For Indian Rupees
    symbol: '₹',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [AppShadows.primaryShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ESTIMATED MONTHLY SAVINGS',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          // Replaced TweenAnimationBuilder with AnimatedTextKit for annual savings
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Approximate Savings', style: TextStyle(color: Colors.white70)),
              const Gap(8),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 54000),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Text(
                    _currencyFormat.format(value),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ) ?? const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const Text('Per Year', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
            ],
          ),
          const Gap(24),
          Text(
            'Based on ₹3,000/month electricity bill',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 24),
          
          // Progress bar using LinearPercentIndicator
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  lineHeight: 8.0,
                  animation: true,
                  animationDuration: 1500,
                  percent: 0.60,
                  barRadius: const Radius.circular(8),
                  progressColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '78%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onCalculate,
                child: Center(
                  child: Text(
                    'Calculate My Savings',
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
    );
  }
}
