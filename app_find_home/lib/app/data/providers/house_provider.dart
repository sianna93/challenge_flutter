import 'package:app_find_home/app/core/config/config.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:dio/dio.dart';

class HouseProvider{

  Future<List<HouseModel>> getHouses({
    required String? token
  })async {
    final _dio = Dio();
    final response = await _dio.get(
        BASEPATH + "/api/house/houses/1/30",
        options: Options(headers: {"auth": token} )
    );

    return (response.data["result"] as List)
          .map((item) => HouseModel.fromJson(item))
         .toList();
  }
}