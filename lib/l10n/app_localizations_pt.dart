// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Digite seu email';

  @override
  String get invalidEmail => 'Email inválido';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get passwordHint => 'Digite sua senha';

  @override
  String get invalidPassword => 'Senha deve ter pelo menos 6 caracteres';

  @override
  String get loginButton => 'Entrar';

  @override
  String get or => 'ou';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get help => 'Ajuda';

  @override
  String get termsOfUse => 'Termos de Uso';
}
