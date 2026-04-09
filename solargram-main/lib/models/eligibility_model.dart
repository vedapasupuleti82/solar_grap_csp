class EligibilityCategory {
  final String id;
  final String label;
  final List<String> schemes;
  final List<String> eligibleIf;
  final String maxSubsidy;
  final String? subsidyPercent;
  final String? consumerPays;
  final String? priority;
  final List<String>? documentsExtra;
  final String? stateNote;
  final String? kusamBonus;
  final String? additionalBenefit;
  final String? note;
  final List<String>? states;

  const EligibilityCategory({
    required this.id,
    required this.label,
    required this.schemes,
    required this.eligibleIf,
    required this.maxSubsidy,
    this.subsidyPercent,
    this.consumerPays,
    this.priority,
    this.documentsExtra,
    this.stateNote,
    this.kusamBonus,
    this.additionalBenefit,
    this.note,
    this.states,
  });
}

class StateSchemeInfo {
  final String discom;
  final String? portal;
  final String? portal_bses;
  final String? portal_tpddl;
  final String? kusamPortal;
  final String? smartSchemePortal;
  final String stateSubsidy;
  final String? policy;
  final String? farmersScheme;
  final String? performanceNote;
  final String? farmersNote;
  final String? specialFeature;
  final String? specialNote;
  final String? note;
  final String? alternatePortal;
  final String? kusamNote;

  const StateSchemeInfo({
    required this.discom,
    this.portal,
    this.portal_bses,
    this.portal_tpddl,
    this.kusamPortal,
    this.smartSchemePortal,
    required this.stateSubsidy,
    this.policy,
    this.farmersScheme,
    this.performanceNote,
    this.farmersNote,
    this.specialFeature,
    this.specialNote,
    this.note,
    this.alternatePortal,
    this.kusamNote,
  });
}

class DocumentItem {
  final String name;
  final bool mandatory;
  final String? purpose;

  const DocumentItem({
    required this.name,
    required this.mandatory,
    this.purpose,
  });
}

class SchemeComparison {
  final String scheme;
  final String target;
  final String maxSubsidy;
  final String subsidyPercent;
  final bool forFarmers;
  final bool casteBonus;
  final bool? loanAvailable;
  final String? loanRate;
  final bool onlineApply;
  final String portal;
  final String? freeElectricity;
  final String deadline;
  final String status;
  final String? bestFor;
  final String? benefit;

  const SchemeComparison({
    required this.scheme,
    required this.target,
    required this.maxSubsidy,
    required this.subsidyPercent,
    required this.forFarmers,
    required this.casteBonus,
    this.loanAvailable,
    this.loanRate,
    required this.onlineApply,
    required this.portal,
    this.freeElectricity,
    required this.deadline,
    required this.status,
    this.bestFor,
    this.benefit,
  });
}

class FAQItem {
  final String question;
  final String answer;
  final String category;

  const FAQItem({
    required this.question,
    required this.answer,
    required this.category,
  });
}
