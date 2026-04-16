import 'package:supabase_flutter/supabase_flutter.dart';
import '../dtos/signup_dto.dart';

abstract class SignupDatasourceRemote {
  Future<AuthResponse> signup({required SignupDto signupDto});
}
