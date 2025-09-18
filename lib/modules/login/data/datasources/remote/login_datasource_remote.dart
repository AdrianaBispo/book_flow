import 'package:supabase_flutter/supabase_flutter.dart';
import '../../dtos/dtos.dart';
abstract class LoginDatasouceRemote {
  Future<AuthResponse> login({required LoginDto loginDto});
}