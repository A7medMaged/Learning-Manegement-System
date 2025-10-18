import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lms/core/utils/shared_pref_helper.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final languageCode = await SharedPrefHelper.getString('languageCode');
    final supportedLocales = ['en', 'ar'];
    if (!supportedLocales.contains(languageCode)) {
      emit(const Locale('en'));
      return;
    } else {
      emit(Locale(languageCode));
    }
  }

  String getLocale() {
    return Intl.getCurrentLocale();
  }

  Future<void> setLocale(Locale locale) async {
    emit(locale);
    await SharedPrefHelper.setData('languageCode', locale.languageCode);
  }
}
