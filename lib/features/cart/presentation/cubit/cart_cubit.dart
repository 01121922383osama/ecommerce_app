import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<CartItem> _items = [];

  CartCubit() : super(const CartState.initial());

  double get totalAmount {
    return _items.fold(
      0,
      (total, item) => total + (item.product.price ?? 0) * item.quantity,
    );
  }

  void addToCart(ProductModel product, {int quantity = 1}) {
    final existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _items.add(CartItem(product: product, quantity: quantity));
    } else {
      final index = _items.indexOf(existingItem);
      _items[index] = CartItem(
        product: product,
        quantity: existingItem.quantity + quantity,
      );
    }
    _updateState();
  }

  void clearCart() {
    _items.clear();
    _updateState();
  }

  void getCartItems() {
    emit(CartState.loaded(items: List.from(_items)));
  }

  void removeFromCart(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    _updateState();
  }

  void updateQuantity(ProductModel product, int quantity) {
    if (quantity <= 0) {
      removeFromCart(product);
      return;
    }

    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItem(product: product, quantity: quantity);
      _updateState();
    }
  }

  void _updateState() {
    if (_items.isEmpty) {
      emit(const CartState.empty());
    } else {
      emit(CartState.loaded(items: List.from(_items)));
    }
  }
}

class CartItem {
  final ProductModel product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  num get totalPrice => (product.price ?? 0) * quantity;
}
