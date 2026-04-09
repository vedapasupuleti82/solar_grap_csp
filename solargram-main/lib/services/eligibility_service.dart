import '../core/models/eligibility_result.dart';

class EligibilityService {
  EligibilityResult check({
    required double annualIncome,
    required String state,
    required String houseType,
  }) {
    final eligible = <String>[];
    final notEligible = <String>[];

    final normalizedHouseType = houseType.toLowerCase();
    final isFarm = normalizedHouseType.contains('farm');
    final isIndependent = normalizedHouseType.contains('independent');

    if (isIndependent) {
      eligible.add('PM Surya Ghar Yojana');
    } else {
      notEligible.add(
        'Rooftop subsidy is stronger for independent houses with usable roof space.',
      );
    }

    if (isFarm) {
      eligible.add('PM-KUSUM Component B');
      eligible.add('PM-KUSUM Component C');
    } else {
      notEligible.add(
        'PM-KUSUM is mainly for agricultural pump use and farm applications.',
      );
    }

    if (state == 'Gujarat' && isIndependent) {
      eligible.add('Gujarat residential rooftop support');
    }

    if (annualIncome > 300000 && !isFarm) {
      notEligible.add(
        'Some local support programs may prioritize lower-income residential families.',
      );
    }

    if (eligible.isEmpty) {
      notEligible.add(
        'Based on the current answers, no matching starter scheme was found.',
      );
    }

    return EligibilityResult(
      eligibleSchemes: eligible,
      notEligibleReasons: notEligible,
    );
  }
}
