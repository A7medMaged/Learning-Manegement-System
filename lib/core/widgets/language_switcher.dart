// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/translation/cubit/local_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.read<LocaleCubit>().setLocale(const Locale('en'));
          },
          child: Text(
            'English',
            style: TextStyle(color: color),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<LocaleCubit>().setLocale(const Locale('ar'));
          },
          child: Text(
            'العربية',
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}
