import 'package:ecommerce_app/features/home/domain/usecases/get_allproducts_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_bags_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_clothes_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_shoes_usecase.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllproductsUsecase _allproductsUsecase;
  final GetClothesUsecase _clothesUsecase;
  final GetShoesUsecase _shoesUsecase;
  final GetBagsUsecase _bagsUsecase;
  HomeCubit({
    required GetAllproductsUsecase allproductsUsecase,
    required GetClothesUsecase clothesUsecase,
    required GetShoesUsecase shoesUsecase,
    required GetBagsUsecase bagsUsecase,
  })  : _allproductsUsecase = allproductsUsecase,
        _clothesUsecase = clothesUsecase,
        _shoesUsecase = shoesUsecase,
        _bagsUsecase = bagsUsecase,
        super(
          const HomeState.initial(),
        );

  Future<void> getAllProducts() async {
    emit(const HomeState.loading());
    final result = await _allproductsUsecase.call();
    result.when(
      success: (data) => emit(HomeState.success(data: data)),
      failure: (error) => emit(HomeState.failure(error: error.message)),
    );
  }

  Future<void> getBags() async {
    emit(const HomeState.loading());
    final result = await _bagsUsecase.call();
    result.when(
      success: (data) => emit(HomeState.success(data: data)),
      failure: (error) => emit(HomeState.failure(error: error.message)),
    );
  }

  Future<void> getClothes() async {
    emit(const HomeState.loading());
    final result = await _clothesUsecase.call();
    result.when(
      success: (data) => emit(HomeState.success(data: data)),
      failure: (error) => emit(HomeState.failure(error: error.message)),
    );
  }

  Future<void> getShoes() async {
    emit(const HomeState.loading());
    final result = await _shoesUsecase.call();
    result.when(
      success: (data) => emit(HomeState.success(data: data)),
      failure: (error) => emit(HomeState.failure(error: error.message)),
    );
  }
}
