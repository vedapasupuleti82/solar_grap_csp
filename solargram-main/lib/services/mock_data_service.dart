import '../core/models/scheme.dart';
import '../core/models/solution_recommendation.dart';

class MockDataService {
  static const List<Scheme> schemes = [
    Scheme(
      title: 'PM Surya Ghar Yojana',
      subtitle: 'Rooftop solar support for homes',
      subsidyLabel: 'Up to 30% subsidy',
      benefit: 'Subsidy support for eligible residential rooftop systems',
      audience: 'Households with regular electricity use',
      details: [
        'Good for families with monthly bills above Rs 800.',
        'Best value when the roof gets strong sunlight.',
        'Documents usually include ID proof, bill, and bank details.',
      ],
    ),
    Scheme(
      title: 'PM-KUSUM Component B',
      subtitle: 'Standalone solar pump for farmers',
      subsidyLabel: 'Often structured around high support share',
      benefit: 'Supports solar irrigation without diesel dependency',
      audience: 'Farmers with irrigation needs and open land',
      details: [
        'Useful where grid power is weak or unavailable.',
        'Can reduce diesel expense and pump downtime.',
        'Apply through state nodal agencies or approved partners.',
      ],
    ),
    Scheme(
      title: 'PM-KUSUM Component C',
      subtitle: 'Solarisation of existing grid-connected pumps',
      subsidyLabel: 'Support varies by state and feeder program',
      benefit: 'Converts existing pumps to solar-assisted use',
      audience: 'Farmers already using grid-connected pumps',
      details: [
        'Helps lower farm power cost during irrigation seasons.',
        'May allow export of excess energy in some states.',
        'Technical feasibility depends on local feeder conditions.',
      ],
    ),
  ];

  static const List<String> states = [
    'Andhra Pradesh',
    'Gujarat',
    'Karnataka',
    'Maharashtra',
    'Rajasthan',
    'Tamil Nadu',
    'Telangana',
    'Uttar Pradesh',
  ];

  static const List<String> learningTopics = [
    'Solar energy turns sunlight into electricity for homes, farms, and shops.',
    'A solar system can reduce bills, improve power reliability, and cut diesel use.',
    'Panels need open sunlight, clean mounting space, and a safe inverter location.',
  ];

  static const List<SolutionRecommendation> recommendations = [
    SolutionRecommendation(
      problemKey: 'Frequent power cuts at home',
      title: 'Solar Home System',
      description:
          'A rooftop or small home system can run lights, fans, charging, and TV during power cuts.',
      idealFor: 'Homes with daily outages and enough roof space.',
      nextStep: 'Check your roof and estimate your monthly bill savings.',
    ),
    SolutionRecommendation(
      problemKey: 'High diesel cost for irrigation',
      title: 'Solar Pump',
      description:
          'A solar pump can lower fuel spending and make irrigation more predictable.',
      idealFor: 'Farmers using diesel pumps or weak grid supply.',
      nextStep: 'Collect pump HP details and explore PM-KUSUM support.',
    ),
    SolutionRecommendation(
      problemKey: 'Low voltage in shop or center',
      title: 'Hybrid Solar Backup',
      description:
          'A hybrid system with battery backup can support lights, fans, billing, and device charging.',
      idealFor: 'Small rural businesses, clinics, and study centers.',
      nextStep: 'List your daily load and speak with a verified installer.',
    ),
  ];
}
