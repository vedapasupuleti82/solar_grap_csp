class SolarCalculationResult {
  const SolarCalculationResult({
    required this.systemSizeKw,
    required this.estimatedCost,
    required this.subsidyAmount,
    required this.finalCost,
    required this.monthlySavings,
    required this.paybackYears,
    required this.yearlyGenerationUnits,
  });

  final double systemSizeKw;
  final double estimatedCost;
  final double subsidyAmount;
  final double finalCost;
  final double monthlySavings;
  final double paybackYears;
  final double yearlyGenerationUnits;
}
