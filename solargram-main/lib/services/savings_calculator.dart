class SavingsCalculation {
  final double systemSizeKw;
  final double totalCost;
  final double subsidy;
  final double finalCost;
  final double monthlySavings;
  final double paybackYears;

  SavingsCalculation({
    required this.systemSizeKw,
    required this.totalCost,
    required this.subsidy,
    required this.finalCost,
    required this.monthlySavings,
    required this.paybackYears,
  });
}

class SavingsCalculatorService {
  // A simplified rule-of-thumb model for Indian context.
  // Real world requires location, tariff slabs, etc.
  
  static const double costPerKw = 60000.0; // ₹60,000 per kW
  static const double unitsPerKwMonthly = 120.0; // Approx 4 units/day/kW
  static const double avgTariff = 8.0; // ₹8 per unit

  static SavingsCalculation calculate(double monthlyBillAmount) {
    if (monthlyBillAmount <= 0) {
      return SavingsCalculation(
        systemSizeKw: 0,
        totalCost: 0,
        subsidy: 0,
        finalCost: 0,
        monthlySavings: 0,
        paybackYears: 0,
      );
    }

    // Estimate monthly units
    double units = monthlyBillAmount / avgTariff;
    
    // Calculate required system size
    double requiredKw = units / unitsPerKwMonthly;
    // Round to nearest 0.5 kW
    requiredKw = (requiredKw * 2).round() / 2.0;
    if (requiredKw < 1.0) requiredKw = 1.0;

    double cost = requiredKw * costPerKw;
    
    // Typical PM Surya Ghar subsidy (simplified)
    // - up to 2kW: 30,000 / kW
    // - 2 to 3kW: 30,000 for additional kW (max 78,000)
    // We use a simple flat rate here to demonstrate the value:
    double govtSubsidy = 0;
    if (requiredKw <= 2) {
      govtSubsidy = requiredKw * 30000;
    } else if (requiredKw > 2 && requiredKw <= 3) {
      govtSubsidy = 60000 + ((requiredKw - 2) * 18000);
    } else {
      govtSubsidy = 78000;
    }

    double finalPrice = cost - govtSubsidy;
    
    // Assuming 90% of current bill will be saved
    double avgMonthlySaving = monthlyBillAmount * 0.9;
    
    double payback = (finalPrice / (avgMonthlySaving * 12));

    return SavingsCalculation(
      systemSizeKw: requiredKw,
      totalCost: cost,
      subsidy: govtSubsidy,
      finalCost: finalPrice,
      monthlySavings: avgMonthlySaving,
      paybackYears: payback,
    );
  }
}
