class StateData {
  final double tariff;
  final double sunHours;
  
  const StateData({required this.tariff, required this.sunHours});
}

class SolarRecommendation {
  final double systemSizeKw;
  final double monthlyGeneration;
  final double annualSaving;
  final int roofAreaRequired;
  final double estimatedCost;
  final int panelCount;
  final String systemType;

  const SolarRecommendation({
    required this.systemSizeKw,
    required this.monthlyGeneration,
    required this.annualSaving,
    required this.roofAreaRequired,
    required this.estimatedCost,
    required this.panelCount,
    required this.systemType,
  });
}

class SolarCalculator {
  // Input parameters
  double monthlyBill; // in ₹
  int roofSizeInSqFt;
  String state;
  String category; // BPL / SC / ST / OBC / General
  double electricityTariff; // ₹/unit
  double sunlightHoursPerDay; 

  SolarCalculator({
    required this.monthlyBill,
    required this.roofSizeInSqFt,
    required this.state,
    required this.category,
    required this.electricityTariff,
    required this.sunlightHoursPerDay,
  });

  // DERIVED CALCULATIONS

  double get monthlyUnitsConsumed => monthlyBill / electricityTariff;

  double get recommendedSystemSizeKw {
    // 1 kW generates ~4 units/day = 120 units/month (average India)
    return (monthlyUnitsConsumed / 120).ceilToDouble();
  }

  double get systemInstallationCost {
    // Average ₹50,000–55,000 per kW (2024 rates)
    return recommendedSystemSizeKw * 52000;
  }

  double get centralSubsidy {
    if (recommendedSystemSizeKw <= 2) return recommendedSystemSizeKw * 30000;
    if (recommendedSystemSizeKw <= 3) return 60000 + ((recommendedSystemSizeKw - 2) * 18000);
    return 78000; // Capped at ₹78,000
  }

  double get stateSubsidy {
    if (state == 'Maharashtra') {
      if (category == 'BPL') return recommendedSystemSizeKw * 17500;
      if (category == 'SC' || category == 'ST') return recommendedSystemSizeKw * 15000;
      if (category == 'EWS') return recommendedSystemSizeKw * 10000;
    }
    if (state == 'Gujarat') return 40000; // ₹40,000 flat additional
    return 0;
  }

  double get totalSubsidy => centralSubsidy + stateSubsidy;
  double get consumerNetCost => systemInstallationCost - totalSubsidy;
  double get subsidyPercent => (totalSubsidy / systemInstallationCost) * 100;

  double get monthlyGenerationUnits => recommendedSystemSizeKw * 120;
  double get monthlyBillSaving => monthlyGenerationUnits * electricityTariff;
  double get annualSaving => monthlyBillSaving * 12;
  double get paybackYears => consumerNetCost / annualSaving;

  double get lifetimeSavings25Years {
    // Solar panels degrade ~0.5%/year
    double total = 0;
    for (int year = 1; year <= 25; year++) {
      double degradedUnits = monthlyGenerationUnits * 12 * (1 - (year * 0.005));
      total += degradedUnits * electricityTariff;
    }
    return total - consumerNetCost;
  }

  double get co2OffsetTonsPerYear => recommendedSystemSizeKw * 1.5;
  double get treesEquivalentPerYear => co2OffsetTonsPerYear * 66; // 1 ton CO2 = ~66 trees

  // SURPLUS ELECTRICITY INCOME
  double get surplusUnitsPerMonth {
    if (monthlyGenerationUnits > monthlyUnitsConsumed) {
      return monthlyGenerationUnits - monthlyUnitsConsumed;
    }
    return 0;
  }
  double get monthlyGridIncome => surplusUnitsPerMonth * (electricityTariff * 0.7);
  double get annualGridIncome => monthlyGridIncome * 12;
}

class SystemRecommendationLogic {
  static SolarRecommendation getRecommendation({
    required double monthlyBill,
    required int roofAreaSqFt,
    required String state,
    required Map<String, StateData> stateDataRegistry,
  }) {
    double tariff = stateDataRegistry[state]?.tariff ?? 7.0;
    double sunHours = stateDataRegistry[state]?.sunHours ?? 5.0;
    double monthlyUnits = monthlyBill / tariff;

    // Each kW needs ~100 sq ft of roof
    double maxByRoof = (roofAreaSqFt / 100).floorToDouble();

    // Each kW generates sunHours * 30 * 0.75 units/month (75% efficiency)
    double kWNeeded = monthlyUnits / (sunHours * 30 * 0.75);

    double recommended = kWNeeded.clamp(1.0, maxByRoof).clamp(1.0, 10.0);

    return SolarRecommendation(
      systemSizeKw: recommended.ceilToDouble(),
      monthlyGeneration: recommended * sunHours * 30 * 0.75,
      annualSaving: (recommended * sunHours * 30 * 0.75) * tariff * 12,
      roofAreaRequired: (recommended * 100).toInt(),
      estimatedCost: recommended * 52000,
      panelCount: (recommended * 3).toInt(), // ~3 panels per kW (400W panels)
      systemType: recommended <= 3 ? 'On-Grid (Recommended)' : 'Hybrid',
    );
  }
}
