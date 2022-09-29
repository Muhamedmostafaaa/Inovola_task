import 'package:inovola_task/features/details/domain/entities/reserv_types.dart';

class ReservTypesModel extends ReservTypes {
 const ReservTypesModel(
      {required super.id,
      required super.count,
      required super.price,
      required super.name});
  factory ReservTypesModel.fromJson(Map<String, dynamic> json) =>
      ReservTypesModel(
          id: json['id'],
          count: json['count'],
          price: json['price'],
          name: json['name']);
}
