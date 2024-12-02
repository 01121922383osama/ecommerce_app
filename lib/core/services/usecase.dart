import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';

abstract class Usecase<T> {
  Future<Results<T, ErrorFailure>> call();
}
