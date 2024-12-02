part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final String id;

  const AuthSuccess({required this.id});
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});
  @override
  List<Object> get props => [];
}
