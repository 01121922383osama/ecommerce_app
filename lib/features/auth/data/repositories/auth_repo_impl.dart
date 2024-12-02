import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepoImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;
  @override
  Future<Results<String, ErrorFailure>> sigIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authRemoteDatasource.sigIn(
        email: email,
        password: password,
      );
      return Success(data: response);
    } on ServerError catch (e) {
      return Failure(error: ErrorFailure(message: e.errorMessage));
    }
  }

  @override
  Future<void> sigOut() async {
    return await _authRemoteDatasource.sigOut();
  }

  @override
  Future<Results<String, ErrorFailure>> sigUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authRemoteDatasource.sigUp(
        email: email,
        password: password,
      );
      return Success(data: response);
    } on ServerError catch (e) {
      return Failure(error: ErrorFailure(message: e.errorMessage));
    }
  }
}
