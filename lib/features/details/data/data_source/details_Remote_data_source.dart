import 'package:inovola_task/core/error/excptions.dart';
import 'package:inovola_task/core/network/api_constants.dart';
import 'package:inovola_task/core/network/dio_helper.dart';
import 'package:inovola_task/features/details/data/models/details_model.dart';

abstract class BaseDetailsRemoteDataSource{
  Future<DetailsModel>getDetails();
}
class DetailsRemoteDataSource extends BaseDetailsRemoteDataSource{
  final BaseDioHelper dioHelper;

  DetailsRemoteDataSource(this.dioHelper);

  @override
  Future<DetailsModel> getDetails()async {
    final response =await dioHelper.getData(path: ApiConstants.details);
    if (response.statusCode == 200) {
      return DetailsModel.fromJson(response.data);
    } else {
      throw
      RemoteServerException(
        errorMessage: 'Server Error'

      );
    }
  }
  
  
  
}



