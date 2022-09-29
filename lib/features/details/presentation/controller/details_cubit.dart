import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/usecases/base_usecase.dart';
import 'package:inovola_task/core/utils/Strings_manager.dart';
import 'package:inovola_task/features/details/domain/entities/details.dart';
import 'package:inovola_task/features/details/domain/use_cases/get_details_use_case.dart';
import 'package:inovola_task/features/details/presentation/components/icon_component.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetDetailsUseCase getDetailsUseCase;
  DetailsCubit(this.getDetailsUseCase) : super(DetailsInitial());
  Details? details;
  String errorMessage = '';
  List<String> list = [];
  int currentIndex = 0;
  List<String> images = [
    StringsManager.backGround1,
    StringsManager.backGround2,
    StringsManager.backGround3,
    StringsManager.backGround4,
  ];

  void getDetails() async {
    emit(DetailsLoadingState());
    final result = await getDetailsUseCase.call(NoParameter());
    result.fold((l) {
      errorMessage = l.errorMessage;
      emit(DetailsErrorState());
    }, (r) {
      details = r;
      emit(DetailsSucessState());
    });
  }

  String parsingString(String text) {
    list = text.split("\n");

    String vacationdetails = '';
    for (int i = 0; i < list.length; i++) {
      vacationdetails = vacationdetails + list[i];
    }

    return vacationdetails;
  }
    Widget getCircularIndicatoer(int index){
    if(index==currentIndex){
      emit(ChangeIndicatoerState());
      return IconComponent(width: 26.w, height: 26.h, imagePath: StringsManager.clickedIcon);
    }else{
      return IconComponent(width: 18.w, height: 18.h, imagePath: StringsManager.unClickedIcon);
    }


  }

}
