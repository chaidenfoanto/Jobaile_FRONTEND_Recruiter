import 'package:flutter/foundation.dart';

abstract class OnboardingEvent {}

class PageChanged extends OnboardingEvent {
  final int page;
  PageChanged(this.page);
}

class SkipPressed extends OnboardingEvent {}

class EnableLocationPressed extends OnboardingEvent {
  final VoidCallback? onSuccessNavigate;

  EnableLocationPressed({this.onSuccessNavigate});
}

