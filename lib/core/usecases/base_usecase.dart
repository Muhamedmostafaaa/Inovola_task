

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:inovola_task/core/error/failuer.dart';


abstract class BaseUseCase<T, Paramters> {
  Future<Either<Failure, T>> call(Paramters parameter);
}

class NoParameter extends Equatable {

  const NoParameter();

  @override
  List<Object> get props => [];
}