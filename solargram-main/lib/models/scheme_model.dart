enum SchemeCategory { central, state }
enum SchemeType { residential, agricultural, commercial }

class SubsidySlab {
  final String capacity;
  final String? subsidyPerKw;
  final String? totalSubsidy;
  final String? consumerPays;
  final String? freeUnitsPerMonth;
  final String? centralCFA;
  final String? stateAdditional;
  final String? netConsumerCost;
  final String? stateSubsidy;
  final String? maxCapacity;

  const SubsidySlab({
    required this.capacity,
    this.subsidyPerKw,
    this.totalSubsidy,
    this.consumerPays,
    this.freeUnitsPerMonth,
    this.centralCFA,
    this.stateAdditional,
    this.netConsumerCost,
    this.stateSubsidy,
    this.maxCapacity,
  });
}

class EligibilityCriteria {
  final String? citizenship;
  final int? ageMin;
  final String? propertyType;
  final bool? ownershipRequired;
  final bool? rooftopRequired;
  final String? electricityConnection;
  final String? previousSubsidy;
  final String? incomeGroup;
  final String? govtEmployee;
  final String? incomeTaxPayer;
  final String? housingType;
  
  // Custom fields for farmers/others
  final String? primaryBeneficiary;
  final List<String>? otherBeneficiaries;
  final String? landRequirement;
  final String? gridConnection;
  final String? landForComponentA;
  
  // Custom fields for states
  final String? state;
  final String? electricityBoard;
  final String? consumptionThreshold;
  final List<String>? categories;
  final String? maxCapacity;
  final List<String>? ineligible;
  final List<String>? priorityRegions;
  
  final String? residential;
  final String? maxSize;
  final String? commercial;
  final String? condition;

  const EligibilityCriteria({
    this.citizenship,
    this.ageMin,
    this.propertyType,
    this.ownershipRequired,
    this.rooftopRequired,
    this.electricityConnection,
    this.previousSubsidy,
    this.incomeGroup,
    this.govtEmployee,
    this.incomeTaxPayer,
    this.housingType,
    
    this.primaryBeneficiary,
    this.otherBeneficiaries,
    this.landRequirement,
    this.gridConnection,
    this.landForComponentA,
    
    this.state,
    this.electricityBoard,
    this.consumptionThreshold,
    this.categories,
    this.maxCapacity,
    this.ineligible,
    this.priorityRegions,
    
    this.residential,
    this.maxSize,
    this.commercial,
    this.condition,
  });
}

class LoanDetails {
  final String maxAmount;
  final String interestRate;
  final String collateral;
  final List<String> banks;
  final String loanPortal;
  final String processingTime;

  const LoanDetails({
    required this.maxAmount,
    required this.interestRate,
    required this.collateral,
    required this.banks,
    required this.loanPortal,
    required this.processingTime,
  });
}

class DocumentRequired {
  final String name;
  final String purpose;
  final bool mandatory;
  final String? format;
  final List<String>? options;
  final String? note;
  final String? quantity;
  final String? timing;

  const DocumentRequired({
    required this.name,
    required this.purpose,
    required this.mandatory,
    this.format,
    this.options,
    this.note,
    this.quantity,
    this.timing,
  });
}

class AppStep {
  final int step;
  final String title;
  final String description;
  final String? url;
  final String timeRequired;

  const AppStep({
    required this.step,
    required this.title,
    required this.description,
    this.url,
    required this.timeRequired,
  });
}

class FinancialBenefits {
  final String freeElectricity;
  final String annualSavings;
  final String surplusSellRate;
  final String paybackPeriod;
  final String systemLifespan;
  final String afterPayback;
  final String roi;
  final String carbonOffset;
  final String jobsCreated;

  const FinancialBenefits({
    required this.freeElectricity,
    required this.annualSavings,
    required this.surplusSellRate,
    required this.paybackPeriod,
    required this.systemLifespan,
    required this.afterPayback,
    required this.roi,
    required this.carbonOffset,
    required this.jobsCreated,
  });
}

// Components for PM KUSUM
class KusumComponent {
  final String name;
  final String title;
  final String description;
  final String? plantCapacity;
  final String? location;
  final List<String>? eligibleBeneficiaries;
  final String? benefit;
  final String? cfa;
  final String? pumpCapacity;
  final String? targetAreas;
  final SubsidyStructure? subsidyStructure;
  final SubsidyStructure? specialCategoryStates;
  final String? pvCapacity;

  const KusumComponent({
    required this.name,
    required this.title,
    required this.description,
    this.plantCapacity,
    this.location,
    this.eligibleBeneficiaries,
    this.benefit,
    this.cfa,
    this.pumpCapacity,
    this.targetAreas,
    this.subsidyStructure,
    this.specialCategoryStates,
    this.pvCapacity,
  });
}

class SubsidyStructure {
  final String centralCFA;
  final String stateSubsidy;
  final String farmerContribution;
  final String? effectiveFarmerPay;

  const SubsidyStructure({
    required this.centralCFA,
    required this.stateSubsidy,
    required this.farmerContribution,
    this.effectiveFarmerPay,
  });
}

class CasteSubsidy {
  final String state;
  final String category;
  final String stateSubsidy;
  final String farmerPays;

  const CasteSubsidy({
    required this.state,
    required this.category,
    required this.stateSubsidy,
    required this.farmerPays,
  });
}

class CategorySubsidy {
  final String category;
  final String centralSubsidy;
  final String stateSubsidy;
  final String totalSubsidy;
  final String consumerPays;
  final String eligibleUnits;
  final int priority;
  final String? targetHouseholds;

  const CategorySubsidy({
    required this.category,
    required this.centralSubsidy,
    required this.stateSubsidy,
    required this.totalSubsidy,
    required this.consumerPays,
    required this.eligibleUnits,
    required this.priority,
    this.targetHouseholds,
  });
}

class SubScheme {
  final String name;
  final bool forFarmers;
  final String subsidyPercent;
  final String farmerUpfrontPayment;
  final String loanForRemaining;
  final String benefit;

  const SubScheme({
    required this.name,
    required this.forFarmers,
    required this.subsidyPercent,
    required this.farmerUpfrontPayment,
    required this.loanForRemaining,
    required this.benefit,
  });
}

class GHSSubsidy {
  final String name;
  final String subsidyPerKw;
  final String maxCapacity;
  final String eligibility;

  const GHSSubsidy({
    required this.name,
    required this.subsidyPerKw,
    required this.maxCapacity,
    required this.eligibility,
  });
}

class SchemeModel {
  final String id;
  final String name;
  final String? fullName;
  final String? hindiName;
  final String? launchDate;
  final int? launchYear;
  final String? launchedBy;
  final String? ministry;
  final String? implementingMinistry;
  final String? totalBudget;
  final String? targetHouseholds;
  final String? targetCapacity;
  final String? targetDeadline;
  final String? officialPortal;
  final String? applyPortal;
  final String? helpline;
  final SchemeCategory category;
  final SchemeType? type;
  
  final List<SubsidySlab>? subsidySlabs;
  final EligibilityCriteria? eligibility;
  final List<String>? specialCategoryStates;
  final LoanDetails? loanDetails;
  final dynamic documentsRequired; // either list of strings or DocumentRequired
  final List<AppStep>? applicationSteps;
  final String? statusCheckUrl;
  final FinancialBenefits? financialBenefits;
  
  final List<KusumComponent>? components;
  final String? mnrePortal;
  final Map<String, String>? statePortals;
  final List<String>? specialFeatures;
  final List<CasteSubsidy>? casteSpecificSubsidies;
  
  final String? state;
  final String? implementingAgency;
  final String? validTill;
  final List<CategorySubsidy>? categorySubsidies;
  
  final String? policyName;
  final String? policyValidTill;
  final String? projectLifeBenefits;
  final String? alternatePortal;
  final String? customerCare;
  final List<SubsidySlab>? subsidyStructure;
  final SubScheme? farmerSubScheme;
  final List<String>? stateDiscoms;
  
  final GHSSubsidy? ghuSubsidy;
  final String? subsidyRate;
  final String? maxSubsidy;
  
  final List<String>? implementingBodiesDynamic; // renamed slightly from the prompt to fit type
  final Map<String, String>? officialPortals;
  final String? subsidyNote;
  
  final List<String>? states;
  final Map<String, String>? implementingBodiesMap;
  final List<String>? features;
  final String? netMeteringLimit;
  final String? note;

  const SchemeModel({
    required this.id,
    required this.name,
    this.fullName,
    this.hindiName,
    this.launchDate,
    this.launchYear,
    this.launchedBy,
    this.ministry,
    this.implementingMinistry,
    this.totalBudget,
    this.targetHouseholds,
    this.targetCapacity,
    this.targetDeadline,
    required this.officialPortal,
    this.applyPortal,
    this.helpline,
    required this.category,
    this.type,
    this.subsidySlabs,
    this.eligibility,
    this.specialCategoryStates,
    this.loanDetails,
    this.documentsRequired,
    this.applicationSteps,
    this.statusCheckUrl,
    this.financialBenefits,
    this.components,
    this.mnrePortal,
    this.statePortals,
    this.specialFeatures,
    this.casteSpecificSubsidies,
    this.state,
    this.implementingAgency,
    this.validTill,
    this.categorySubsidies,
    this.policyName,
    this.policyValidTill,
    this.projectLifeBenefits,
    this.alternatePortal,
    this.customerCare,
    this.subsidyStructure,
    this.farmerSubScheme,
    this.stateDiscoms,
    this.ghuSubsidy,
    this.subsidyRate,
    this.maxSubsidy,
    this.implementingBodiesDynamic,
    this.officialPortals,
    this.subsidyNote,
    this.states,
    this.implementingBodiesMap,
    this.features,
    this.netMeteringLimit,
    this.note,
  });
}
