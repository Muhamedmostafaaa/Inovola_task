part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class DetailsLoadingState extends DetailsState{}
class DetailsErrorState extends DetailsState{}
class DetailsSucessState extends DetailsState{}
class ChangeIndicatoerState extends DetailsState{}