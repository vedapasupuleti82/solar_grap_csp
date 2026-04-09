import 'dart:math';

import '../core/models/solar_calculation_result.dart';

class SolarCalculatorService {
  static const double unitsPerKwPerMonth = 120;
  static const double unitsPerKwPerDay = 4;
  static const double costPerKw = 60000;
  static const double subsidyRate = 0.30;

  SolarCalculationResult calculate({
    required double monthlyBill,
    required double monthlyUnits,
  }) {
    final sanitizedUnits = max(monthlyUnits, 1).toDouble();
    final sanitizedBill = max(monthlyBill, 1).toDouble();
    final systemSizeKw = sanitizedUnits / unitsPerKwPerMonth;
    final estimatedCost = systemSizeKw * costPerKw;
    final subsidyAmount = estimatedCost * subsidyRate;
    final finalCost = estimatedCost - subsidyAmount;
    final monthlySavings = min(sanitizedBill, sanitizedUnits * 8).toDouble();
    final paybackYears = finalCost / monthlySavings / 12;
    final yearlyGenerationUnits = systemSizeKw * unitsPerKwPerDay * 365;

    return SolarCalculationResult(
      systemSizeKw: systemSizeKw,
      estimatedCost: estimatedCost,
      subsidyAmount: subsidyAmount,
      finalCost: finalCost,
      monthlySavings: monthlySavings,
      paybackYears: paybackYears,
      yearlyGenerationUnits: yearlyGenerationUnits,
    );
  }
}
