import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/excptions.dart';
import 'package:inovola_task/core/error/failuer.dart';
import 'package:inovola_task/core/usecases/base_usecase.dart';
import 'package:inovola_task/features/details/data/data_source/details_Remote_data_source.dart';
import 'package:inovola_task/features/details/domain/entities/details.dart';
import 'package:inovola_task/features/details/domain/repository/base_details_repository.dart';

class DetailsRepository extends BaseDetailsRepository {
  final BaseDetailsRemoteDataSource baseDetailsRemoteDataSource;

  DetailsRepository(this.baseDetailsRemoteDataSource);

  @override
  Future<Either<Failure, Details>> getDetails() async {
    final result = await baseDetailsRemoteDataSource.getDetails();

    try {
      return Right(result);
    } on RemoteServerException catch (failuer) {
      return Left(ServerFailure(failuer.errorMessage));
    }
  }
}
