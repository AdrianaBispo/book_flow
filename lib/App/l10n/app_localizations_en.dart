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

  @override
  String get helpHeaderTitle => 'How can we help?';

  @override
  String get helpHeaderSubtitle =>
      'Find answers to the most frequently asked questions.';

  @override
  String get faq1Title => 'How to create an account?';

  @override
  String get faq1Content =>
      'To create an account, click the \'Create account\' button on the login screen and fill in your details.';

  @override
  String get faq2Title => 'How to recover my password?';

  @override
  String get faq2Content =>
      'On the login screen, click \'Forgot my password\' to receive a recovery email.';

  @override
  String get faq3Title => 'How to search for books?';

  @override
  String get faq3Content =>
      'Use the search bar on the main screen to find books by title, author, or genre.';

  @override
  String get faq4Title => 'How to favorite a book?';

  @override
  String get faq4Content =>
      'When opening the details of a book, click on the heart icon to add it to your favorites.';

  @override
  String get faq5Title => 'Can I read offline?';

  @override
  String get faq5Content =>
      'Yes, you can download books to read when you are not connected to the internet.';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get contactSupportLegend => 'Didn\'t find what you were looking for?';

  @override
  String get contactSupportDescription =>
      'Our support team is ready to help you.';

  @override
  String get myLibrary => 'My Library';

  @override
  String get emptyLibraryTitle => 'Your library is empty.';

  @override
  String get emptyLibrarySubtitle => 'Explore search to download new books.';

  @override
  String get errorLoadingLibrary => 'Error loading your library.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get readingStatus => 'Reading...';

  @override
  String get newStatus => 'NEW';
}
