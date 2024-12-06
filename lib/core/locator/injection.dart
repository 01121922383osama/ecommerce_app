import 'package:ecommerce_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:ecommerce_app/features/home/data/repositories/home_repoimpl.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_allproducts_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_bags_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_clothes_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_shoes_usecase.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;
Future<void> init() async {
  await dotenv.load(fileName: ".env");
  final Supabase supabase = await Supabase.initialize(
    url: dotenv.env['URL']!,
    anonKey: dotenv.env['ANONKEY']!,
  );
  // cubit
  locator.registerFactory(() => AuthCubit(
        signInUsecase: locator.get(),
        signUpUsecase: locator.get(),
        signOutUsecase: locator.get(),
      ));
  locator.registerFactory(
    () => HomeCubit(
      allproductsUsecase: locator.get(),
      clothesUsecase: locator.get(),
      shoesUsecase: locator.get(),
      bagsUsecase: locator.get(),
    ),
  );

  // usecases
  locator.registerLazySingleton(() => SignInUsecase(authRepo: locator.get()));
  locator.registerLazySingleton(() => SignUpUsecase(authRepo: locator.get()));
  locator.registerLazySingleton(() => SignOutUsecase(authRepo: locator.get()));
  locator.registerLazySingleton(
      () => GetAllproductsUsecase(homeRepo: locator.get()));
  locator
      .registerLazySingleton(() => GetClothesUsecase(homeRepo: locator.get()));
  locator.registerLazySingleton(() => GetShoesUsecase(homeRepo: locator.get()));
  locator.registerLazySingleton(() => GetBagsUsecase(homeRepo: locator.get()));

  // repositories
  locator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authRemoteDatasource: locator.get()));
  locator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(remoteDatasource: locator.get()));

  // data sources
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(supabaseClient: locator.get()));
  locator.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(client: locator.get()),
  );
  // others
  locator.registerLazySingleton<SupabaseClient>(() => supabase.client);
}
