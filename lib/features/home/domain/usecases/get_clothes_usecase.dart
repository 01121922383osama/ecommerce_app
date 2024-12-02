import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/core/services/usecase.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_repo.dart';

class GetClothesUsecase implements Usecase<List<ProductModel>> {
  final HomeRepo _homeRepo;

  GetClothesUsecase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<Results<List<ProductModel>, ErrorFailure>> call() async {
    return await _homeRepo.getClothes();
  }
}
