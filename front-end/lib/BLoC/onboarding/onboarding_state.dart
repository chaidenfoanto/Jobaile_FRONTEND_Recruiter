class OnboardingState {
  final int currentPage;
  final bool isLoading;

  OnboardingState({required this.currentPage, this.isLoading = false});

  OnboardingState copyWith({int? currentPage, bool? isLoading}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
