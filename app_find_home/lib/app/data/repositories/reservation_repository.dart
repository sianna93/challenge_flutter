import 'package:app_find_home/app/data/model/reservation_model.dart';
import 'package:app_find_home/app/data/providers/reservation_provider.dart';
import 'package:get/get.dart';

class ReservationRepository{
  final _apiProvider = Get.find<ReservationProvider>();

  Future<String> saveReservation({
    required String token,
    required ReservationModel reservationModel
  }) => _apiProvider.saveReservation(reservationModel: reservationModel, token: token);
}