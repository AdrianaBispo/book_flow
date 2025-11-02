// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get digitalLibrary => 'Sua biblioteca digital';

  @override
  String get emailLabel => 'E-mail';

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
  String get orSeparator => 'ou';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get help => 'Ajuda';

  @override
  String get termsOfUse => 'Termos de Uso';

  @override
  String get invalidCredentials => 'E-mail ou senha incorretos.';

  @override
  String get emailNotConfirmed => 'Confirme seu e-mail antes de continuar.';

  @override
  String get authenticationError =>
      'Não foi possível realizar o login. Verifique seu e-mail e senha e tente novamente.';

  @override
  String get databaseErrorMessage =>
      'Falha ao acessar o banco de dados. Pode haver instabilidade no servidor — tente novamente em alguns instantes.';

  @override
  String get unexpectedError =>
      'Ocorreu um erro inesperado. Nossa equipe já foi notificada — tente novamente mais tarde.';

  @override
  String get errorDatabaseSearch =>
      'Não foi possível carregar as informações solicitadas. Verifique sua conexão e tente novamente.';

  @override
  String get errorUnknownSearch =>
      'Encontramos um problema ao buscar os dados. Tente novamente em alguns minutos.';
}
