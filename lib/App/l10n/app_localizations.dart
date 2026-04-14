import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// Title or tagline shown on the app’s home screen.
  ///
  /// In en, this message translates to:
  /// **'Your digital library'**
  String get digitalLibrary;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Hint text for the email field
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// Validation message when email format is incorrect
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Hint text for the password field
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// Validation message when password does not meet minimum requirements
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get invalidPassword;

  /// Text for the login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Separator between login options
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get orSeparator;

  /// Text for the create account link or button
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// Text for the help link
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// Text for the terms of use link
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// Message displayed when login credentials are invalid
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get invalidCredentials;

  /// Message displayed when user tries to login without confirming email
  ///
  /// In en, this message translates to:
  /// **'Please confirm your email before continuing.'**
  String get emailNotConfirmed;

  /// Authentication error, usually caused by invalid credentials or an expired session.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your email and password and try again.'**
  String get authenticationError;

  /// Error related to database communication or connection failure.
  ///
  /// In en, this message translates to:
  /// **'Failed to access the database. The server may be unstable — please try again in a few moments.'**
  String get databaseErrorMessage;

  /// Unhandled system error, usually caused by unexpected exceptions.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Our team has been notified — please try again later.'**
  String get unexpectedError;

  /// Error when fetching data from the database, possibly due to a network or server issue.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t load the requested information. Please check your internet connection and try again.'**
  String get errorDatabaseSearch;

  /// Unexpected error that occurred while performing a data search operation.
  ///
  /// In en, this message translates to:
  /// **'We ran into a problem while fetching data. Try again in a few minutes.'**
  String get errorUnknownSearch;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Type something to search for books'**
  String get searchPlaceholder;

  /// No description provided for @searchBarHintText.
  ///
  /// In en, this message translates to:
  /// **'Search books'**
  String get searchBarHintText;

  /// No description provided for @emptyResultSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Try searching with different terms'**
  String get emptyResultSearchTitle;

  /// No description provided for @emptyResultSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try searching with different keywords'**
  String get emptyResultSearchSubtitle;

  /// No description provided for @helpHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get helpHeaderTitle;

  /// No description provided for @helpHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find answers to the most frequently asked questions.'**
  String get helpHeaderSubtitle;

  /// No description provided for @faq1Title.
  ///
  /// In en, this message translates to:
  /// **'How to create an account?'**
  String get faq1Title;

  /// No description provided for @faq1Content.
  ///
  /// In en, this message translates to:
  /// **'To create an account, click the \'Create account\' button on the login screen and fill in your details.'**
  String get faq1Content;

  /// No description provided for @faq2Title.
  ///
  /// In en, this message translates to:
  /// **'How to recover my password?'**
  String get faq2Title;

  /// No description provided for @faq2Content.
  ///
  /// In en, this message translates to:
  /// **'On the login screen, click \'Forgot my password\' to receive a recovery email.'**
  String get faq2Content;

  /// No description provided for @faq3Title.
  ///
  /// In en, this message translates to:
  /// **'How to search for books?'**
  String get faq3Title;

  /// No description provided for @faq3Content.
  ///
  /// In en, this message translates to:
  /// **'Use the search bar on the main screen to find books by title, author, or genre.'**
  String get faq3Content;

  /// No description provided for @faq4Title.
  ///
  /// In en, this message translates to:
  /// **'How to favorite a book?'**
  String get faq4Title;

  /// No description provided for @faq4Content.
  ///
  /// In en, this message translates to:
  /// **'When opening the details of a book, click on the heart icon to add it to your favorites.'**
  String get faq4Content;

  /// No description provided for @faq5Title.
  ///
  /// In en, this message translates to:
  /// **'Can I read offline?'**
  String get faq5Title;

  /// No description provided for @faq5Content.
  ///
  /// In en, this message translates to:
  /// **'Yes, you can download books to read when you are not connected to the internet.'**
  String get faq5Content;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @contactSupportLegend.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t find what you were looking for?'**
  String get contactSupportLegend;

  /// No description provided for @contactSupportDescription.
  ///
  /// In en, this message translates to:
  /// **'Our support team is ready to help you.'**
  String get contactSupportDescription;

  /// No description provided for @myLibrary.
  ///
  /// In en, this message translates to:
  /// **'My Library'**
  String get myLibrary;

  /// No description provided for @emptyLibraryTitle.
  ///
  /// In en, this message translates to:
  /// **'Your library is empty.'**
  String get emptyLibraryTitle;

  /// No description provided for @emptyLibrarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore search to download new books.'**
  String get emptyLibrarySubtitle;

  /// No description provided for @errorLoadingLibrary.
  ///
  /// In en, this message translates to:
  /// **'Error loading your library.'**
  String get errorLoadingLibrary;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @readingStatus.
  ///
  /// In en, this message translates to:
  /// **'Reading...'**
  String get readingStatus;

  /// No description provided for @newStatus.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newStatus;

  /// No description provided for @detailsDescriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get detailsDescriptionTitle;

  /// No description provided for @detailsInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get detailsInfoTitle;

  /// No description provided for @detailsPagesLabel.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get detailsPagesLabel;

  /// No description provided for @detailsLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get detailsLanguageLabel;

  /// No description provided for @detailsReleaseLabel.
  ///
  /// In en, this message translates to:
  /// **'Release'**
  String get detailsReleaseLabel;

  /// No description provided for @detailsAddToLibrary.
  ///
  /// In en, this message translates to:
  /// **'Add to Library'**
  String get detailsAddToLibrary;

  /// No description provided for @detailsInLibrary.
  ///
  /// In en, this message translates to:
  /// **'In Library'**
  String get detailsInLibrary;

  /// No description provided for @detailsAddedToLibrarySnack.
  ///
  /// In en, this message translates to:
  /// **'Added to your library!'**
  String get detailsAddedToLibrarySnack;

  /// No description provided for @detailsGenreGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get detailsGenreGeneral;

  /// No description provided for @detailsPagesValue.
  ///
  /// In en, this message translates to:
  /// **'320'**
  String get detailsPagesValue;

  /// No description provided for @detailsLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get detailsLanguageValue;

  /// No description provided for @detailsReleaseValue.
  ///
  /// In en, this message translates to:
  /// **'2023'**
  String get detailsReleaseValue;

  /// Title for the favorites screen
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get favoritesTitle;

  /// Title for the empty favorites state
  ///
  /// In en, this message translates to:
  /// **'No favorites yet.'**
  String get emptyFavoritesTitle;

  /// Subtitle for the empty favorites state
  ///
  /// In en, this message translates to:
  /// **'Books you favorite will appear here.'**
  String get emptyFavoritesSubtitle;

  /// Error message when favorites fail to load
  ///
  /// In en, this message translates to:
  /// **'We couldn’t load your favorites. Please try again.'**
  String get errorLoadingFavorites;

  /// Message shown when a book is removed from favorites
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get removedFromFavoritesSnack;

  /// Message shown when a book is added to favorites
  ///
  /// In en, this message translates to:
  /// **'Added to favorites!'**
  String get addedToFavoritesSnack;

  /// Message shown on favorites screen when user is not logged in
  ///
  /// In en, this message translates to:
  /// **'Log in to see your favorites'**
  String get favoritesLoginRequired;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
