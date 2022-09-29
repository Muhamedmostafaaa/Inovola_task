import 'package:get_it/get_it.dart';
import 'package:inovola_task/core/network/dio_helper.dart';
import 'package:inovola_task/features/details/data/data_source/details_Remote_data_source.dart';
import 'package:inovola_task/features/details/data/repository/details_repository.dart';
import 'package:inovola_task/features/details/domain/repository/base_details_repository.dart';
import 'package:inovola_task/features/details/domain/use_cases/get_details_use_case.dart';
import 'package:inovola_task/features/details/presentation/controller/details_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => DetailsCubit(sl()));

    ///USE CASE

    sl.registerLazySingleton(() => GetDetailsUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseDetailsRepository>(
        () => DetailsRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseDetailsRemoteDataSource>(
        () => DetailsRemoteDataSource(sl()));

    /// Dio
    sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  }
}
