import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repo.dart';

class SignInUsecase {
  final AuthRepo _authRepo;

  SignInUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<Results<String, ErrorFailure>> call(
      {required String email, required String password}) async {
    return await _authRepo.sigIn(
      email: email,
      password: password,
    );
  }
}
