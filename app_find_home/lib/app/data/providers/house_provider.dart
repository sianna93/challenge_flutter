import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:dio/dio.dart';

class HouseProvider{
  String _basePath = "https://api-reservation-flutter.herokuapp.com";

  Future<List<HouseModel>> getHouses({
    required String? token
  })async {
    final _dio = Dio();
    final response = await _dio.get(
        _basePath + "/api/house/houses/1/6",
        options: Options(headers: {"auth": token} )
    );

    return (response.data["result"] as List)
          .map((item) => HouseModel.fromJson(item))
         .toList();
  }
}