import 'package:myapp/app/app.dart';

class FavoriteException extends AppException {
  FavoriteException({super.stackTrace});
}

class FavoriteServerException extends FavoriteException {
  FavoriteServerException({super.stackTrace});
}

class FavoriteUnknownException extends FavoriteException {
  FavoriteUnknownException({super.stackTrace});
}
