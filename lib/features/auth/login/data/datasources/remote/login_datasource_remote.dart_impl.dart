import 'package:myapp/modules/modules.dart';

class LoginDatasouceRemoteImpl extends LoginDatasouceRemote {
  final SupabaseClient supabaseClient;

  LoginDatasouceRemoteImpl({required this.supabaseClient});

  @override
  Future<AuthResponse> login({required LoginDto loginDto}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: loginDto.email!,
        password: loginDto.password!,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}