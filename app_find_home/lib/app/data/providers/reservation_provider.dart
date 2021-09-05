import 'dart:convert';

import 'package:app_find_home/app/core/config/config.dart';
import 'package:app_find_home/app/data/model/reservation_model.dart';
import 'package:dio/dio.dart';

class ReservationProvider{
  Future<String> saveReservation({
    required String token,
    required ReservationModel reservationModel
    /*required DateTime date,
    required double price,
    required int idHouse,
    required int idUser*/
  })async {
    final _dio = Dio();
    final response = await _dio.post(
        BASEPATH + "/api/reservation/register",
        options: Options(headers: {"auth": token}),
        data: json.encode(reservationModel.toJson())

        /*data: {
          "date": reservationModel.date.toString(),
          "price": reservationModel.price,
          "idHouse": reservationModel.idHouse,
          "idUser": reservationModel.idUser,
        }*/
    );

    return response.data["message"];
  }
}