import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/failuer.dart';
import 'package:inovola_task/core/usecases/base_usecase.dart';
import 'package:inovola_task/features/details/domain/entities/details.dart';
import 'package:inovola_task/features/details/domain/repository/base_details_repository.dart';

class GetDetailsUseCase extends BaseUseCase<Details,NoParameter>{
  final BaseDetailsRepository baseDetailsRepository;

  GetDetailsUseCase(this.baseDetailsRepository);

  @override
  Future<Either<Failure, Details>> call(NoParameter parameter) async{
   return await baseDetailsRepository.getDetails();
  }



}
