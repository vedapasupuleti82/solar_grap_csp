class SchemeModel {
  final String title;
  final String shortDesc;
  final String eligibility;
  final String subsidyAmount;

  SchemeModel({
    required this.title,
    required this.shortDesc,
    required this.eligibility,
    required this.subsidyAmount,
  });
}

class SchemeService {
  static List<SchemeModel> getSchemes() {
    return [
      SchemeModel(
        title: 'PM Surya Ghar: Muft Bijli Yojana',
        shortDesc: 'Provides up to 300 units of free electricity per month to 1 crore households.',
        eligibility: 'Residential households with valid electricity connection and suitable roof.',
        subsidyAmount: 'Up to ₹78,000',
      ),
      SchemeModel(
        title: 'PM KUSUM Scheme',
        shortDesc: 'For farmers to install solar pumps and grid-connected solar power plants.',
        eligibility: 'Individual farmers, groups, cooperatives, panchayats.',
        subsidyAmount: 'Up to 60% of cost',
      ),
      SchemeModel(
        title: 'State Specific Subsidies',
        shortDesc: 'Additional subsidies provided by various state governments on top of central.',
        eligibility: 'Varies by state policies.',
        subsidyAmount: 'Varies (₹10,000 - ₹30,000)',
      ),
    ];
  }
}
