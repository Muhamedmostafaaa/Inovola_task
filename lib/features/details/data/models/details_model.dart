import 'package:inovola_task/features/details/data/models/reserv_types_model.dart';
import 'package:inovola_task/features/details/domain/entities/details.dart';

class DetailsModel extends Details {
 const DetailsModel(
      {required super.tittle,
      required super.id,
      required super.interest,
      required super.price,
      required super.date,
      required super.address,
      required super.trainerName,
      required super.trainerInfo,
      required super.occasionDetail,
      required super.reservTypes});
  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
      tittle: json['title'],
      id: json['id'],
      interest: json['interest'],
      price: json['price'],
      date: json['date'],
      address: json['address'],
      trainerName: json['trainerName'],
      trainerInfo: json['trainerInfo'],
      occasionDetail: json['occasionDetail'],
      reservTypes:List.from(json['reservTypes'].map((e) => ReservTypesModel.fromJson(e)))) ;
}
