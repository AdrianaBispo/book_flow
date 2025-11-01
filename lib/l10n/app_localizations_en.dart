// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get invalidPassword => 'Password must be at least 6 characters';

  @override
  String get loginButton => 'Login';

  @override
  String get orSeparator => 'or';

  @override
  String get createAccount => 'Create account';

  @override
  String get help => 'Help';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get invalidCredentials => 'Invalid email or password.';

  @override
  String get emailNotConfirmed =>
      'Please confirm your email before continuing.';

  @override
  String authenticationError(String message) {
    return 'Authentication error: $message';
  }

  @override
  String databaseError(String message) {
    return 'Database error: $message';
  }

  @override
  String unexpectedError(String error) {
    return 'Unexpected error: $error';
  }

  @override
  String errorDatabaseSearch(String message) {
    return 'Error fetching data: $message';
  }

  @override
  String errorUnknownSearch(String message) {
    return 'Unexpected error: $message';
  }
}
