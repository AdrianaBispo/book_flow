import 'package:supabase_flutter/supabase_flutter.dart';
import '../dtos/signup_dto.dart';
import 'signup_datasource_remote.dart';

class SignupDatasourceRemoteImpl implements SignupDatasourceRemote {
  final SupabaseClient supabaseClient;

  SignupDatasourceRemoteImpl({required this.supabaseClient});

  @override
  Future<AuthResponse> signup({required SignupDto signupDto}) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: signupDto.email,
        password: signupDto.password,
        data: {
          'username': signupDto.username,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
