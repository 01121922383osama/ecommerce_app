import 'package:freezed_annotation/freezed_annotation.dart';

part 'results.freezed.dart';

@freezed
class Results<T, F> with _$Results<T, F> {
  const factory Results.success({required T data}) = Success;
  const factory Results.failure({required F error}) = Failure;
}
