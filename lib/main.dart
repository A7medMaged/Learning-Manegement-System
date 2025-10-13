import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LmsApp());
}

class LmsApp extends StatelessWidget {
  const LmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello, World!'),
              const SizedBox(height: 20),
              const AppTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              AppTextButton(
                text: 'Press',
                onTap: () {},
                textStyle: Styles.style22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
