import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';

abstract interface class AuthRepo {
  Future<Results<String, ErrorFailure>> sigIn({
    required String email,
    required String password,
  });
  Future<Results<String, ErrorFailure>> sigUp({
    required String email,
    required String password,
  });
  Future<void> sigOut();
}
