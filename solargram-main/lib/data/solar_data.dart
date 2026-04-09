import '../models/scheme_model.dart';
import '../models/eligibility_model.dart';
import '../models/calculator_model.dart';

class SolarData {

  // ===== SCHEMES REGISTRY =====
  static const List<SchemeModel> allSchemes = [
    SchemeModel(
      id: 'pmsg_001',
      name: 'PM Surya Ghar: Muft Bijli Yojana',
      hindiName: 'पीएम सूर्य घर: मुफ्त बिजली योजना',
      launchDate: 'February 15, 2024',
      launchedBy: 'PM Narendra Modi',
      ministry: 'Ministry of New and Renewable Energy (MNRE)',
      totalBudget: '₹75,021 crore (~US\$9 billion)',
      targetHouseholds: '1 Crore (10 Million)',
      targetDeadline: 'March 2027',
      officialPortal: 'https://pmsuryaghar.gov.in',
      applyPortal: 'https://solarrooftop.gov.in',
      helpline: '1800-180-3333',
      category: SchemeCategory.central,
      type: SchemeType.residential,
      subsidySlabs: [
        SubsidySlab(capacity: '1 kW', subsidyPerKw: '₹30,000', totalSubsidy: '₹30,000', consumerPays: '~₹20,000–25,000', freeUnitsPerMonth: '100–120 units'),
        SubsidySlab(capacity: '2 kW', subsidyPerKw: '₹30,000', totalSubsidy: '₹60,000', consumerPays: '~₹35,000–45,000', freeUnitsPerMonth: '200–240 units'),
        SubsidySlab(capacity: '3 kW', subsidyPerKw: '₹18,000 (for 3rd kW)', totalSubsidy: '₹78,000', consumerPays: '~₹50,000–65,000', freeUnitsPerMonth: '300+ units'),
        SubsidySlab(capacity: 'Above 3 kW', subsidyPerKw: 'Capped at ₹78,000 max', totalSubsidy: '₹78,000', consumerPays: 'Remaining cost', freeUnitsPerMonth: '300+ units'),
      ],
      eligibility: EligibilityCriteria(
        citizenship: 'Indian Citizen only',
        ageMin: 18,
        propertyType: 'Residential property only (NOT commercial/industrial)',
        ownershipRequired: true,
        rooftopRequired: true,
        electricityConnection: 'Valid and active electricity connection required',
        previousSubsidy: 'Must NOT have availed any other solar subsidy before',
        incomeGroup: 'Poor and middle-income households (preferred)',
        govtEmployee: 'NO government employees',
        incomeTaxPayer: 'NO income tax payers (for priority category)',
        housingType: 'Individual house OR Group Housing Society (GHS/RWA)',
      ),
      specialCategoryStates: ['North-East India (all 8 states)', 'Sikkim', 'Uttarakhand', 'Himachal Pradesh', 'Jammu & Kashmir', 'Ladakh (UT)', 'Andaman & Nicobar Islands', 'Lakshadweep'],
      loanDetails: LoanDetails(
        maxAmount: '₹2,00,000',
        interestRate: '6.75–7% per annum (subsidized)',
        collateral: 'ZERO collateral required',
        banks: ['SBI', 'Bank of Baroda', 'PNB', 'Union Bank', 'Canara Bank', 'Indian Bank', 'BOI'],
        loanPortal: 'https://jansamarth.in',
        processingTime: '15 days average',
      ),
      applicationSteps: [
        AppStep(step: 1, title: 'Register on Portal', description: 'Go to pmsuryaghar.gov.in', timeRequired: '10 minutes'),
      ],
    ),
    SchemeModel(
      id: 'pmkusum_002',
      name: 'PM KUSUM Scheme',
      fullName: 'Pradhan Mantri Kisan Urja Suraksha evam Utthaan Mahabhiyan',
      hindiName: 'प्रधानमंत्री किसान ऊर्जा सुरक्षा एवं उत्थान महाभियान',
      launchYear: 2019,
      implementingMinistry: 'Ministry of New and Renewable Energy (MNRE)',
      totalBudget: '₹34,422 crore',
      targetCapacity: '34,800 MW by March 2026',
      officialPortal: 'https://pmkusum.mnre.gov.in',
      mnrePortal: 'https://mnre.gov.in',
      category: SchemeCategory.central,
      type: SchemeType.agricultural,
      components: [
        KusumComponent(name: 'Component A', title: 'Decentralized Solar Power Plants', description: 'Set up 10,000 MW of decentralized solar plants', plantCapacity: '500 kW to 2 MW per plant'),
      ],
      eligibility: EligibilityCriteria(
        primaryBeneficiary: 'Farmers with agricultural land',
        otherBeneficiaries: ['Rural households', 'Public institutions', 'Rural businesses'],
      ),
    ),
    SchemeModel(
      id: 'mh_smart_003',
      name: 'SMART Solar Scheme',
      fullName: 'Swayampurna Maharashtra Residential Rooftop Solar Scheme',
      state: 'Maharashtra',
      launchDate: 'October 7, 2025',
      implementingAgency: 'MSEDCL',
      totalBudget: '₹655 crore',
      targetHouseholds: '5,00,000',
      officialPortal: 'https://msedcl.maharashtra.gov.in',
      category: SchemeCategory.state,
      type: SchemeType.residential,
      categorySubsidies: [
        CategorySubsidy(category: 'BPL', centralSubsidy: '₹30,000', stateSubsidy: '₹17,500', totalSubsidy: '₹47,500', consumerPays: '₹2,500 ONLY', eligibleUnits: 'Below 100', priority: 1)
      ],
    ),
    SchemeModel(
      id: 'surya_guj_004',
      name: 'SURYA Gujarat',
      fullName: 'Surya Urja Rooftop Yojana',
      state: 'Gujarat',
      implementingAgency: 'GUVNL',
      officialPortal: 'https://suryagujarat.guvnl.in',
      category: SchemeCategory.state,
      type: SchemeType.residential,
      subsidyStructure: [
        SubsidySlab(capacity: '1 kW to 2 kW', centralCFA: '₹30,000/kW', stateAdditional: '₹40,000 additional', netConsumerCost: 'Significantly reduced')
      ]
    ),
  ];

  // ===== ELIGIBILITY MATRIX =====
  static const List<EligibilityCategory> allCategories = [
    EligibilityCategory(
      id: 'gen_residential', label: 'General Residential', schemes: ['PM Surya Ghar', 'MNRE Phase II'],
      eligibleIf: ['Indian citizen', 'Property owner', 'Valid electricity connection', 'Residential property', 'No prior solar subsidy', 'Age ≥ 18'],
      maxSubsidy: '₹78,000', subsidyPercent: '40–60%',
    ),
    EligibilityCategory(
      id: 'bpl', label: 'BPL (Below Poverty Line)', schemes: ['PM Surya Ghar', 'Maharashtra SMART'],
      eligibleIf: ['BPL Card holder', 'Monthly electricity consumption below 100 units', 'Property owner'],
      maxSubsidy: '₹47,500 (Maharashtra) | ₹78,000 (Central)', subsidyPercent: 'Up to 95%', consumerPays: 'As low as ₹2,500 only!',
      priority: 'HIGHEST PRIORITY',
    ),
    EligibilityCategory(
      id: 'sc', label: 'SC (Scheduled Caste)', schemes: ['PM Surya Ghar', 'Maharashtra SMART'],
      eligibleIf: ['SC Certificate', 'Property owner', 'Valid electricity connection'],
      maxSubsidy: '₹45,000 (Maharashtra) + central = 90% total',
    ),
    EligibilityCategory(
      id: 'farmer', label: 'Farmer (Agricultural Land Owner)', schemes: ['PM KUSUM', 'Suryashakti Kishan Yojana'],
      eligibleIf: ['Agricultural land ownership', 'Khasra/Khatauni in your name'],
      maxSubsidy: 'Up to 90%', additionalBenefit: 'Earn income by selling surplus power',
    ),
  ];

  // ===== STATE SPECIFIC SCHEME INFO =====
  static const Map<String, StateSchemeInfo> stateSolarPortals = {
    'Andhra Pradesh': StateSchemeInfo(discom: 'APSPDCL / APEPDCL', portal: 'https://nredcap.in', stateSubsidy: 'Central PM Surya Ghar applies'),
    'Delhi': StateSchemeInfo(discom: 'BSES Rajdhani / BSES Yamuna / TPDDL', portal_bses: 'https://www.bsesdelhi.com', stateSubsidy: 'Group net metering + solar rebates', specialFeature: 'Group net metering for apartments'),
    'Gujarat': StateSchemeInfo(discom: 'DGVCL / MGVCL / PGVCL / UGVCL', portal: 'https://suryagujarat.guvnl.in', stateSubsidy: 'Additional ₹40,000 (residential)', policy: 'Gujarat Solar Power Policy 2021', farmersScheme: 'Suryashakti Kisan Yojana', performanceNote: '#1 state in rooftop solar installations'),
    'Maharashtra': StateSchemeInfo(discom: 'MSEDCL', portal: 'https://msedcl.maharashtra.gov.in', stateSubsidy: 'SMART Scheme: 90–95% for BPL/SC/ST', specialNote: 'Best state scheme for BPL: only ₹2,500 for 1 kW system!'),
    'Rajasthan': StateSchemeInfo(discom: 'JDVVNL / AVVNL', portal: 'https://rreclmis.energy.rajasthan.gov.in', stateSubsidy: 'Auto-approval for delays; virtual net metering'),
    'Uttar Pradesh': StateSchemeInfo(discom: 'DVVNL / MVVNL', portal: 'https://upneda.org.in', stateSubsidy: 'KUSUM: 60–70% for SC/ST/OBC farmers'),
  };

  // ===== STATE TARIFF DATA =====
  static const Map<String, StateData> stateData = {
    'Andhra Pradesh': StateData(tariff: 7.50, sunHours: 5.5),
    'Delhi': StateData(tariff: 8.00, sunHours: 5.0),
    'Gujarat': StateData(tariff: 5.50, sunHours: 6.0),
    'Haryana': StateData(tariff: 7.00, sunHours: 5.5),
    'Karnataka': StateData(tariff: 7.00, sunHours: 5.5),
    'Maharashtra': StateData(tariff: 8.00, sunHours: 5.5),
    'Rajasthan': StateData(tariff: 6.50, sunHours: 6.5),
    'Tamil Nadu': StateData(tariff: 6.50, sunHours: 5.5),
    'Uttar Pradesh': StateData(tariff: 6.50, sunHours: 5.5),
  };

  // ===== SCHEMES COMPARISON =====
  static const List<SchemeComparison> schemeComparisons = [
    SchemeComparison(scheme: 'PM Surya Ghar', target: 'All Residential', maxSubsidy: '₹78,000', subsidyPercent: '40–60%', forFarmers: false, casteBonus: false, loanAvailable: true, onlineApply: true, portal: 'pmsuryaghar.gov.in', deadline: 'March 2027', status: 'ACTIVE ✅'),
    SchemeComparison(scheme: 'Maharashtra SMART', target: 'BPL/SC/ST in MH', maxSubsidy: '₹47,500', subsidyPercent: '80–95%', forFarmers: false, casteBonus: true, onlineApply: true, portal: 'msedcl.maharashtra.gov.in', deadline: 'March 2027', status: 'ACTIVE ✅', bestFor: 'BPL in Maharashtra (only ₹2,500 out of pocket!)'),
    SchemeComparison(scheme: 'PM KUSUM', target: 'Farmers', maxSubsidy: '60–90%', subsidyPercent: '60–90%', forFarmers: true, casteBonus: true, onlineApply: true, portal: 'pmkusum.mnre.gov.in', deadline: 'March 2026', status: 'ACTIVE ✅'),
  ];

  // ===== FAQS =====
  static const List<FAQItem> solarFAQs = [
    FAQItem(question: 'Can a tenant apply for PM Surya Ghar?', answer: 'No. Only property owners can apply. Tenants/renters are NOT eligible. The applicant must own the property with the roof.', category: 'Eligibility'),
    FAQItem(question: 'How much does a 1 kW solar system cost after subsidy?', answer: 'A 1 kW system costs ~₹50,000-55,000. After ₹30,000 central subsidy, you pay ~₹20,000-25,000. In Maharashtra (BPL), you pay only ₹2,500!', category: 'Cost'),
    FAQItem(question: 'Can I get a loan if I cannot afford the remaining cost?', answer: 'Yes! Collateral-free loans up to ₹2 lakh are available at 6.75-7% interest through 12 public sector banks.', category: 'Loan'),
    FAQItem(question: 'How long does the subsidy take to come to my bank account?', answer: 'Within 15-30 days via Direct Benefit Transfer (DBT) after successful installation and inspection.', category: 'Process'),
  ];
}
