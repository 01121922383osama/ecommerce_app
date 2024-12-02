import 'package:ecommerce_app/core/errors/server_error.dart';

class ErrorFailure implements ServerError {
  final String message;
  const ErrorFailure({required this.message});

  @override
  String get errorMessage => message;
}
