abstract interface class OnboardingLocalDataSource {
  /// Setter is onboarding locale passed
  Future<void> setIsOnboardingLocalePassed({
    required bool isOnboardingLocalePassed,
  });

  /// Getter for onboarding locale passed
  bool get isOnboardingLocalePassed;
}
