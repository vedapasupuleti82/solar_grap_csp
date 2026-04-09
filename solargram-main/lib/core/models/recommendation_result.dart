class RecommendationResult {
  const RecommendationResult({
    required this.title,
    required this.summary,
    required this.reasons,
    required this.nextStep,
  });

  final String title;
  final String summary;
  final List<String> reasons;
  final String nextStep;
}
