import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';
import '../core/theme/app_colors.dart';
import '../widgets/premium_button.dart';
import '../models/calculator_model.dart';
import '../data/solar_data.dart';

class CalculatorScreen extends StatefulWidget {
  final bool isBottomNav;
  const CalculatorScreen({super.key, this.isBottomNav = false});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double _monthlyBill = 3000;
  String _selectedState = 'Maharashtra';
  String _selectedCategory = 'General Residential';
  int _roofSize = 1000;
  bool _showResult = false;
  
  final _currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

  SolarCalculator get _calculator {
    final stateData = SolarData.stateData[_selectedState] ?? const StateData(tariff: 7.0, sunHours: 5.0);
    return SolarCalculator(
      monthlyBill: _monthlyBill,
      roofSizeInSqFt: _roofSize,
      state: _selectedState,
      category: _selectedCategory == 'BPL (Below Poverty Line)' ? 'BPL' :
                _selectedCategory == 'SC (Scheduled Caste)' ? 'SC' : 'General',
      electricityTariff: stateData.tariff,
      sunlightHoursPerDay: stateData.sunHours,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isBottomNav ? AppBar(title: const Text('Savings Calculator')) : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Savings Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildInputCard(),
            const SizedBox(height: 32),
            if (_showResult) _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard() {
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
          Text('Monthly Electricity Bill', style: Theme.of(context).textTheme.titleLarge),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_currencyFormat.format(500), style: const TextStyle(color: AppColors.textSecondary)),
              Text(_currencyFormat.format(_monthlyBill), 
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppColors.primaryDark),
              ),
              Text(_currencyFormat.format(15000), style: const TextStyle(color: AppColors.textSecondary)),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.primary.withValues(alpha: 0.1),
              thumbColor: AppColors.primaryDark,
              overlayColor: AppColors.primary.withValues(alpha: 0.2),
              trackHeight: 8,
            ),
            child: Slider(
              value: _monthlyBill,
              min: 500,
              max: 15000,
              divisions: 145,
              onChanged: (val) {
                setState(() {
                  _monthlyBill = val;
                  _showResult = false;
                });
              },
            ),
          ),
          const Gap(24),
          _buildDropdown('State', _selectedState, SolarData.stateData.keys.toList(), (val) {
            setState(() { _selectedState = val!; _showResult = false; });
          }),
          const Gap(16),
          _buildDropdown('Category', _selectedCategory, SolarData.allCategories.map((e) => e.label).toList(), (val) {
            setState(() { _selectedCategory = val!; _showResult = false; });
          }),
          const Gap(32),
          PremiumButton(
            text: 'Calculate Savings',
            onPressed: () {
              setState(() => _showResult = true);
            },
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms).slideY(begin: 0.1);
  }

  Widget _buildDropdown(String label, String value, List<String> items, void Function(String?) onChanged) {
    if (!items.contains(value)) value = items.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textSecondary.withValues(alpha: 0.2)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary),
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard() {
    final calc = _calculator;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text('YOUR ESTIMATED SAVINGS', style: Theme.of(context).textTheme.labelSmall?.copyWith(letterSpacing: 1.2)),
          const Gap(16),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 12.0,
            animation: true,
            animationDuration: 1500,
            percent: (calc.subsidyPercent / 100).clamp(0.0, 1.0),
            center: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: calc.annualSaving),
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    return Text(
                      _currencyFormat.format(value),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary) ?? const TextStyle(),
                    );
                  },
                ),
                Text('Savings/yr', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            progressColor: AppColors.primary,
            backgroundColor: AppColors.accent,
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 180,
          ),
          const Gap(24),
          const Divider(),
          const Gap(16),
          _buildResultRow('Monthly Savings', _currencyFormat.format(calc.monthlyBillSaving)),
          _buildResultRow('System Cost', _currencyFormat.format(calc.systemInstallationCost)),
          _buildResultRow('Govt. Subsidy', _currencyFormat.format(calc.totalSubsidy), isHighlight: true),
          _buildResultRow('Your Net Cost', _currencyFormat.format(calc.consumerNetCost), isHighlight: true),
          _buildResultRow('Recommended System', '${calc.recommendedSystemSizeKw.toStringAsFixed(1)} kW'),
          _buildResultRow('Est. Payback', '${calc.paybackYears.toStringAsFixed(1)} Years'),
          _buildResultRow('25-Yr Lifetime', _currencyFormat.format(calc.lifetimeSavings25Years)),
          
          if (calc.surplusUnitsPerMonth > 0) ...[
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                   const Icon(Icons.monetization_on_rounded, color: AppColors.primaryDark),
                   const SizedBox(width: 12),
                   Expanded(child: Text('You can earn an extra ${_currencyFormat.format(calc.annualGridIncome)}/yr by selling surplus power!', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryDark))),
                ],
              ),
            )
          ]
        ],
      ),
    ).animate().fade().slideY(begin: 0.2);
  }

  Widget _buildResultRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
          Text(
            value, 
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isHighlight ? AppColors.primaryDark : null,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.w600,
            )
          ),
        ],
      ),
    );
  }
}
