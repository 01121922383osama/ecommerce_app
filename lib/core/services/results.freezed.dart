// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Results<T, F> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(F error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(F error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(F error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, F> value) success,
    required TResult Function(Failure<T, F> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, F> value)? success,
    TResult? Function(Failure<T, F> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, F> value)? success,
    TResult Function(Failure<T, F> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsCopyWith<T, F, $Res> {
  factory $ResultsCopyWith(
          Results<T, F> value, $Res Function(Results<T, F>) then) =
      _$ResultsCopyWithImpl<T, F, $Res, Results<T, F>>;
}

/// @nodoc
class _$ResultsCopyWithImpl<T, F, $Res, $Val extends Results<T, F>>
    implements $ResultsCopyWith<T, F, $Res> {
  _$ResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, F, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T, F> value, $Res Function(_$SuccessImpl<T, F>) then) =
      __$$SuccessImplCopyWithImpl<T, F, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, F, $Res>
    extends _$ResultsCopyWithImpl<T, F, $Res, _$SuccessImpl<T, F>>
    implements _$$SuccessImplCopyWith<T, F, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T, F> _value, $Res Function(_$SuccessImpl<T, F>) _then)
      : super(_value, _then);

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T, F>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T, F> implements Success<T, F> {
  const _$SuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'Results<$T, $F>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T, F> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, F, _$SuccessImpl<T, F>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, F, _$SuccessImpl<T, F>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(F error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(F error)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(F error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, F> value) success,
    required TResult Function(Failure<T, F> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, F> value)? success,
    TResult? Function(Failure<T, F> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, F> value)? success,
    TResult Function(Failure<T, F> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T, F> implements Results<T, F> {
  const factory Success({required final T data}) = _$SuccessImpl<T, F>;

  T get data;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, F, _$SuccessImpl<T, F>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, F, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T, F> value, $Res Function(_$FailureImpl<T, F>) then) =
      __$$FailureImplCopyWithImpl<T, F, $Res>;
  @useResult
  $Res call({F error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, F, $Res>
    extends _$ResultsCopyWithImpl<T, F, $Res, _$FailureImpl<T, F>>
    implements _$$FailureImplCopyWith<T, F, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T, F> _value, $Res Function(_$FailureImpl<T, F>) _then)
      : super(_value, _then);

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailureImpl<T, F>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as F,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T, F> implements Failure<T, F> {
  const _$FailureImpl({required this.error});

  @override
  final F error;

  @override
  String toString() {
    return 'Results<$T, $F>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T, F> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, F, _$FailureImpl<T, F>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, F, _$FailureImpl<T, F>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(F error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(F error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(F error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, F> value) success,
    required TResult Function(Failure<T, F> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, F> value)? success,
    TResult? Function(Failure<T, F> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, F> value)? success,
    TResult Function(Failure<T, F> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T, F> implements Results<T, F> {
  const factory Failure({required final F error}) = _$FailureImpl<T, F>;

  F get error;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<T, F, _$FailureImpl<T, F>> get copyWith =>
      throw _privateConstructorUsedError;
}
