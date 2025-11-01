// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login to your account`
  String get login_to_your_acccount {
    return Intl.message(
      'Login to your account',
      name: 'login_to_your_acccount',
      desc: '',
      args: [],
    );
  }

  /// `Register a new account`
  String get register_a_new_account {
    return Intl.message(
      'Register a new account',
      name: 'register_a_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back! Please login to your account.`
  String get welcome_back {
    return Intl.message(
      'Welcome Back! Please login to your account.',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `👋 Welcome! Create your account to get started with our app.`
  String get welcome_register {
    return Intl.message(
      '👋 Welcome! Create your account to get started with our app.',
      name: 'welcome_register',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message('First Name', name: 'first_name', desc: '', args: []);
  }

  /// `Last Name`
  String get last_name {
    return Intl.message('Last Name', name: 'last_name', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Verify your Email`
  String get verify_your_email {
    return Intl.message(
      'Verify your Email',
      name: 'verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `A verification OTP has been sent to your email. \nPlease check your inbox and click the link to verify your account.`
  String get otp_sent_to_email {
    return Intl.message(
      'A verification OTP has been sent to your email. \nPlease check your inbox and click the link to verify your account.',
      name: 'otp_sent_to_email',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Login Successful`
  String get login_successful {
    return Intl.message(
      'Login Successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Registration Successful`
  String get registration_successful {
    return Intl.message(
      'Registration Successful',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get login_failed {
    return Intl.message(
      'Login Failed',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Registration Failed`
  String get registration_failed {
    return Intl.message(
      'Registration Failed',
      name: 'registration_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email address',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get please_enter_confirm_password {
    return Intl.message(
      'Please confirm your password',
      name: 'please_enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get please_enter_first_name {
    return Intl.message(
      'Please enter your first name',
      name: 'please_enter_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get please_enter_last_name {
    return Intl.message(
      'Please enter your last name',
      name: 'please_enter_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get please_enter_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'please_enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get please_enter_valid_phone_number {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'please_enter_valid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your city`
  String get please_enter_city {
    return Intl.message(
      'Please enter your city',
      name: 'please_enter_city',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid city`
  String get please_enter_valid_city {
    return Intl.message(
      'Please enter a valid city',
      name: 'please_enter_valid_city',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_your_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters, include an uppercase and lowercase letter,\n number and symbol.`
  String get valid_password {
    return Intl.message(
      'Password must be at least 8 characters, include an uppercase and lowercase letter,\n number and symbol.',
      name: 'valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Get Code to Reset Password`
  String get get_code {
    return Intl.message(
      'Get Code to Reset Password',
      name: 'get_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to get the password reset code.`
  String get enter_your_email_to_get_code {
    return Intl.message(
      'Enter your email to get the password reset code.',
      name: 'enter_your_email_to_get_code',
      desc: '',
      args: [],
    );
  }

  /// `Code sent`
  String get code_sent {
    return Intl.message('Code sent', name: 'code_sent', desc: '', args: []);
  }

  /// `Error occurred`
  String get error_occured {
    return Intl.message(
      'Error occurred',
      name: 'error_occured',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message('Send Code', name: 'send_code', desc: '', args: []);
  }

  /// `Verify and Change Password`
  String get verify_and_change_password {
    return Intl.message(
      'Verify and Change Password',
      name: 'verify_and_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to your email and change your password.`
  String get enter_otp_sent_to_email {
    return Intl.message(
      'Enter the OTP sent to your email and change your password.',
      name: 'enter_otp_sent_to_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP code`
  String get please_enter_otp {
    return Intl.message(
      'Please enter the OTP code',
      name: 'please_enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 6 digits`
  String get otp_must_be_6_digits {
    return Intl.message(
      'OTP must be 6 digits',
      name: 'otp_must_be_6_digits',
      desc: '',
      args: [],
    );
  }

  /// `OTP must contain only numbers`
  String get otp_must_contain_only_numbers {
    return Intl.message(
      'OTP must contain only numbers',
      name: 'otp_must_contain_only_numbers',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Avatar changed successfully`
  String get avatar_change_successful {
    return Intl.message(
      'Avatar changed successfully',
      name: 'avatar_change_successful',
      desc: '',
      args: [],
    );
  }

  /// `Error changing avatar`
  String get error_changing_avatar {
    return Intl.message(
      'Error changing avatar',
      name: 'error_changing_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Changing Avatar...`
  String get avatar_changing {
    return Intl.message(
      'Changing Avatar...',
      name: 'avatar_changing',
      desc: '',
      args: [],
    );
  }

  /// `Change Avatar`
  String get change_avatar {
    return Intl.message(
      'Change Avatar',
      name: 'change_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Update Information`
  String get update_information {
    return Intl.message(
      'Update Information',
      name: 'update_information',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our App`
  String get welcome_to_our_app {
    return Intl.message(
      'Welcome to our App',
      name: 'welcome_to_our_app',
      desc: '',
      args: [],
    );
  }

  /// `A simple and intuitive app designed to help you stay organized every day.`
  String get simple_and_intuitive {
    return Intl.message(
      'A simple and intuitive app designed to help you stay organized every day.',
      name: 'simple_and_intuitive',
      desc: '',
      args: [],
    );
  }

  /// `Smooth Experience`
  String get smooth_experience {
    return Intl.message(
      'Smooth Experience',
      name: 'smooth_experience',
      desc: '',
      args: [],
    );
  }

  /// `Everything is built to be fast, clean, and easy to use with beautiful design.`
  String get built_for_you {
    return Intl.message(
      'Everything is built to be fast, clean, and easy to use with beautiful design.',
      name: 'built_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started 🚀.`
  String get lets_get_started {
    return Intl.message(
      'Let\'s get started 🚀.',
      name: 'lets_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Begin your journey with us and explore all the features of the app!`
  String get begin {
    return Intl.message(
      'Begin your journey with us and explore all the features of the app!',
      name: 'begin',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your current password`
  String get please_enter_current_password {
    return Intl.message(
      'Please enter your current password',
      name: 'please_enter_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Update your information`
  String get update_your_information {
    return Intl.message(
      'Update your information',
      name: 'update_your_information',
      desc: '',
      args: [],
    );
  }

  /// `Update Failed`
  String get update_failed {
    return Intl.message(
      'Update Failed',
      name: 'update_failed',
      desc: '',
      args: [],
    );
  }

  /// `Information updated successfully`
  String get information_updated_successfully {
    return Intl.message(
      'Information updated successfully',
      name: 'information_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `LMS App`
  String get app_name {
    return Intl.message('LMS App', name: 'app_name', desc: '', args: []);
  }

  /// `Subscription`
  String get subscribtion {
    return Intl.message(
      'Subscription',
      name: 'subscribtion',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// `Subscribe to new courses`
  String get subscribe_to_new_courses {
    return Intl.message(
      'Subscribe to new courses',
      name: 'subscribe_to_new_courses',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Course Details`
  String get course_details {
    return Intl.message(
      'Course Details',
      name: 'course_details',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Content`
  String get content {
    return Intl.message('Content', name: 'content', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Sections`
  String get sections {
    return Intl.message('Sections', name: 'sections', desc: '', args: []);
  }

  /// `Lectures`
  String get lectutes {
    return Intl.message('Lectures', name: 'lectutes', desc: '', args: []);
  }

  /// `Organizations`
  String get organizations {
    return Intl.message(
      'Organizations',
      name: 'organizations',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `No organizations found`
  String get no_organizations_found {
    return Intl.message(
      'No organizations found',
      name: 'no_organizations_found',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
