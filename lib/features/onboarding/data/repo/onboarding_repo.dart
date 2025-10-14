import 'package:lms/core/utils/storage_helper.dart';

class OnboardingRepo {
  final SharedPrefsService storage;

  OnboardingRepo(this.storage);

  static const String onboardingKey = 'onboarding_completed';

  Future<void> setCompleted() async {
    await storage.saveBool(onboardingKey, true);
  }

  Future<bool> isCompleted() async {
    return storage.getBool(onboardingKey) ?? false;
  }
}
