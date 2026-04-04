import '../../../../../../shared/shared.dart';
import '../../../login.dart';
abstract class LoginDatasouceRemote {
  Future<AuthResponse> login({required LoginDto loginDto});
}