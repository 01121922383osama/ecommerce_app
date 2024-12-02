import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> sigIn({
    required String email,
    required String password,
  });
  Future<String> sigUp({
    required String email,
    required String password,
  });
  Future<void> sigOut();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient _supabaseClient;

  AuthRemoteDatasourceImpl({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;
  @override
  Future<String> sigIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!.id;
    } on AuthException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }

  @override
  Future<void> sigOut() {
    return _supabaseClient.auth.signOut();
  }

  @override
  Future<String> sigUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );
      return response.user!.id;
    } on AuthException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }
}
