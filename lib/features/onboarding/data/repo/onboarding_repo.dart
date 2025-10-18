import 'package:lms/core/utils/shared_pref_helper.dart';

class OnboardingRepo {
  final SharedPrefHelper sharedPrefHelper;

  OnboardingRepo(this.sharedPrefHelper);

  static const String onboardingKey = 'onboarding_completed';

  Future<void> setCompleted() async {
    await SharedPrefHelper.setData('onboarding_completed', true);
  }

  Future<bool> isCompleted() async {
    return await SharedPrefHelper.getBool('onboarding_completed');
  }
}
