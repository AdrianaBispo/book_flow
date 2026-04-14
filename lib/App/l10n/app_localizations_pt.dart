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

  @override
  String get searchPlaceholder => 'Digite algo para buscar livros';

  @override
  String get searchBarHintText => 'Buscar livros';

  @override
  String get emptyResultSearchTitle => 'Tente buscar com outros termos';

  @override
  String get emptyResultSearchSubtitle => '\'Tente buscar com outros termos';

  @override
  String get helpHeaderTitle => 'Como podemos ajudar?';

  @override
  String get helpHeaderSubtitle =>
      'Encontre respostas para as dúvidas mais frequentes.';

  @override
  String get faq1Title => 'Como criar uma conta?';

  @override
  String get faq1Content =>
      'Para criar uma conta, clique no botão \'Criar conta\' na tela de login e preencha seus dados.';

  @override
  String get faq2Title => 'Como recuperar minha senha?';

  @override
  String get faq2Content =>
      'Na tela de login, clique em \'Esqueci minha senha\' para receber um e-mail de recuperação.';

  @override
  String get faq3Title => 'Como buscar livros?';

  @override
  String get faq3Content =>
      'Use a barra de busca na tela principal para encontrar livros por título, autor ou gênero.';

  @override
  String get faq4Title => 'Como favoritar um livro?';

  @override
  String get faq4Content =>
      'Ao abrir os detalhes de um livro, clique no ícone de coração para adicioná-lo aos seus favoritos.';

  @override
  String get faq5Title => 'Posso ler offline?';

  @override
  String get faq5Content =>
      'Sim, você pode baixar livros para ler quando não estiver conectado à internet.';

  @override
  String get contactSupport => 'Falar com Suporte';

  @override
  String get contactSupportLegend => 'Não encontrou o que procurava?';

  @override
  String get contactSupportDescription =>
      'Nossa equipe de suporte está pronta para ajudar você.';

  @override
  String get myLibrary => 'Minha Biblioteca';

  @override
  String get emptyLibraryTitle => 'Sua biblioteca está vazia.';

  @override
  String get emptyLibrarySubtitle =>
      'Explore a busca para baixar novos livros.';

  @override
  String get errorLoadingLibrary => 'Erro ao carregar sua biblioteca.';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get readingStatus => 'Lendo...';

  @override
  String get newStatus => 'NOVO';

  @override
  String get detailsDescriptionTitle => 'Descrição';

  @override
  String get detailsInfoTitle => 'Informações';

  @override
  String get detailsPagesLabel => 'Páginas';

  @override
  String get detailsLanguageLabel => 'Linguagem';

  @override
  String get detailsReleaseLabel => 'Lançamento';

  @override
  String get detailsAddToLibrary => 'Adicionar à Biblioteca';

  @override
  String get detailsInLibrary => 'Na Biblioteca';

  @override
  String get detailsAddedToLibrarySnack => 'Adicionado à sua biblioteca!';

  @override
  String get detailsGenreGeneral => 'Geral';

  @override
  String get detailsPagesValue => '320';

  @override
  String get detailsLanguageValue => 'Português';

  @override
  String get detailsReleaseValue => '2023';

  @override
  String get favoritesTitle => 'Meus Favoritos';

  @override
  String get emptyFavoritesTitle => 'Nenhum favorito ainda.';

  @override
  String get emptyFavoritesSubtitle => 'Livros favoritados aparecerão aqui.';

  @override
  String get errorLoadingFavorites => 'Não foi possível carregar seus favoritos. Tente novamente.';

  @override
  String get removedFromFavoritesSnack => 'Removido dos favoritos';

  @override
  String get addedToFavoritesSnack => 'Adicionado aos favoritos!';

  @override
  String get favoritesLoginRequired =>
      'Faça login para visualizar sua lista de favoritos.';
}
