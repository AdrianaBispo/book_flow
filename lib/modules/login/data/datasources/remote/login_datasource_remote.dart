import 'package:myapp/modules/modules.dart';

abstract class LoginDatasouceRemote {
  Future<AuthResponse> login({required LoginDto loginDto});
}