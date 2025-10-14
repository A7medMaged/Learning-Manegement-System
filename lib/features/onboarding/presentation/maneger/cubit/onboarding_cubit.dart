import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/onboarding/data/repo/onboarding_repo.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepo repo;

  OnboardingCubit(this.repo) : super(OnboardingInitial());

  Future<void> completeOnboarding() async {
    await repo.setCompleted();
    emit(OnboardingCompleted());
  }

  Future<void> checkStatus() async {
    final completed = await repo.isCompleted();
    if (completed) {
      emit(OnboardingCompleted());
    } else {
      emit(OnboardingNotCompleted());
    }
  }

  Future<bool> isOnboardingCompleted() async {
    return await repo.isCompleted();
  }
}
