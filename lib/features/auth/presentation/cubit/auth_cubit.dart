import 'package:ecommerce_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;
  final SignOutUsecase _signOutUsecase;
  AuthCubit({
    required SignInUsecase signInUsecase,
    required SignUpUsecase signUpUsecase,
    required SignOutUsecase signOutUsecase,
  })  : _signInUsecase = signInUsecase,
        _signUpUsecase = signUpUsecase,
        _signOutUsecase = signOutUsecase,
        super(const AuthInitial());

  final signInEmail = TextEditingController();
  final signInPassword = TextEditingController();
  final signUpEmail = TextEditingController();
  final signUpPassword = TextEditingController();

  Future<String> sigIn(
      {required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _signInUsecase.call(email: email, password: password);
    return result.when(
      success: (data) {
        emit(AuthSuccess(id: data));
        return data;
      },
      failure: (error) {
        emit(AuthFailure(message: error.message));
        return error.message;
      },
    );
  }

  Future<String> sigUp(
      {required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _signUpUsecase.call(email: email, password: password);
    return result.when(
      success: (data) {
        emit(AuthSuccess(id: data));
        return data;
      },
      failure: (error) {
        emit(AuthFailure(message: error.message));
        return error.message;
      },
    );
  }

  Future<void> sigOut() async {
    await _signOutUsecase.call();
  }
}
