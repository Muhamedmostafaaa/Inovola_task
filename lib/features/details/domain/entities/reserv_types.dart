import 'package:equatable/equatable.dart';

class ReservTypes extends Equatable {
  final int id;
  final int count;
  final int price;
  final String name;

  const ReservTypes({required this.id,
    required this.count,
    required this.price,
    required this.name});

  @override
  List<Object> get props => [id, count, price, name];
}