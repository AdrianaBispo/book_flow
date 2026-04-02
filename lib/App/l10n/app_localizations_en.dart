// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get digitalLibrary => 'Your digital library';

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
  String get authenticationError =>
      'Login failed. Please check your email and password and try again.';

  @override
  String get databaseErrorMessage =>
      'Failed to access the database. The server may be unstable — please try again in a few moments.';

  @override
  String get unexpectedError =>
      'An unexpected error occurred. Our team has been notified — please try again later.';

  @override
  String get errorDatabaseSearch =>
      'We couldn’t load the requested information. Please check your internet connection and try again.';

  @override
  String get errorUnknownSearch =>
      'We ran into a problem while fetching data. Try again in a few minutes.';

  @override
  String get searchPlaceholder => 'Type something to search for books';

  @override
  String get searchBarHintText => 'Search books';

  @override
  String get emptyResultSearchTitle => 'Try searching with different terms';

  @override
  String get emptyResultSearchSubtitle =>
      'Try searching with different keywords';
}
