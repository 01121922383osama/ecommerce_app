import 'package:ecommerce_app/features/auth/domain/repositories/auth_repo.dart';

class SignOutUsecase {
  final AuthRepo _authRepo;

  SignOutUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<void> call() async => await _authRepo.sigOut();
}
