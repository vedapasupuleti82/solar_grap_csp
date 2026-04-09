import '../core/models/recommendation_result.dart';

class RecommendationService {
  RecommendationResult recommend({
    required double monthlyBill,
    required double monthlyUnits,
    required bool frequentPowerCuts,
    required bool irrigationNeed,
  }) {
    final reasons = <String>[];

    if (irrigationNeed) {
      reasons.add('You need daytime irrigation support for farm activity.');
      if (monthlyBill > 1500) {
        reasons.add('A solar pump can reduce both grid and diesel dependence.');
      }

      return RecommendationResult(
        title: 'Solar Pump',
        summary:
            'A solar pump is the strongest match because your usage pattern points to irrigation needs.',
        reasons: reasons,
        nextStep: 'Check pump capacity and explore PM-KUSUM support.',
      );
    }

    if (frequentPowerCuts) {
      reasons.add('You face power cuts, so backup during daylight matters.');
    }
    if (monthlyBill >= 1500) {
      reasons.add('Your monthly bill is high enough for visible savings.');
    }
    if (monthlyUnits >= 150) {
      reasons.add('Your electricity use can justify a rooftop home system.');
    }
    if (reasons.isEmpty) {
      reasons.add('A small solar system can still reduce future energy cost.');
    }

    return RecommendationResult(
      title: 'Solar Home System',
      summary:
          'A rooftop solar home system fits better for household savings and better power reliability.',
      reasons: reasons,
      nextStep:
          'Use the savings calculator and compare final cost after subsidy.',
    );
  }
}
