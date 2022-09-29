import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/failuer.dart';
import 'package:inovola_task/features/details/domain/entities/details.dart';

abstract class BaseDetailsRepository {

  Future<Either<Failure,Details>>getDetails();

}