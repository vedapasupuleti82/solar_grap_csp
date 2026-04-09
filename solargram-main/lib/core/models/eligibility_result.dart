class EligibilityResult {
  const EligibilityResult({
    required this.eligibleSchemes,
    required this.notEligibleReasons,
  });

  final List<String> eligibleSchemes;
  final List<String> notEligibleReasons;
}
