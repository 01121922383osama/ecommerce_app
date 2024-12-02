import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _HomeStateInitial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success({required T data}) = Success<T>;
  const factory HomeState.failure({required String error}) = Failure;
}
