import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repo.dart';

class SignUpUsecase {
  final AuthRepo _authRepo;

  SignUpUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<Results<String, ErrorFailure>> call(
      {required String email, required String password}) async {
    return await _authRepo.sigUp(email: email, password: password);
  }
}
