import 'package:equatable/equatable.dart';
import 'package:inovola_task/features/details/domain/entities/reserv_types.dart';

class Details extends Equatable {
  final String tittle;
  final int id;
  final String interest;
  final int price;
  final String date;
  final String address;
  final String trainerName;
  final String trainerInfo;
  final String occasionDetail;
  final List<ReservTypes> reservTypes;

  const Details({required this.tittle,
    required this.id,
    required this.interest,
    required this.price,
    required this.date,
    required this.address,
    required this.trainerName,
    required this.trainerInfo,
    required this.occasionDetail,
    required this.reservTypes});


  @override
  List<Object> get props =>
      [
        tittle,
        id,
        interest,
        price,
        date,
        address,
        trainerName,
        trainerInfo,
        occasionDetail,
        reservTypes,
      ];
}


