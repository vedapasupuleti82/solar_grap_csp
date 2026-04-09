class SolutionRecommendation {
  const SolutionRecommendation({
    required this.problemKey,
    required this.title,
    required this.description,
    required this.idealFor,
    required this.nextStep,
  });

  final String problemKey;
  final String title;
  final String description;
  final String idealFor;
  final String nextStep;
}
