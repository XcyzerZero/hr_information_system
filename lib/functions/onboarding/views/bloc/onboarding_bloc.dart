import 'dart:async';

import 'package:bloc/bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingEvent>(_onboardingEvent);
  }

  FutureOr<void> _onboardingEvent(
      OnboardingEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingState(page: state.page));
  }
}
