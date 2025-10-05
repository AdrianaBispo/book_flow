import 'package:myapp/modules/modules.dart';
import '../../dtos/dtos.dart';
abstract class LoginDatasouceRemote {
  Future<AuthResponse> login({required LoginDto loginDto});
}