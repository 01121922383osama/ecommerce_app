part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.empty() = _Empty;
  const factory CartState.loaded({required List<CartItem> items}) = _Loaded;
}
