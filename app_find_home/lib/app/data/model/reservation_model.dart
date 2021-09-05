// To parse this JSON data, do
//
//     final reservationModel = reservationModelFromJson(jsonString);

import 'dart:convert';

ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());

class ReservationModel {
  ReservationModel({
    this.id,
    this.idUser,
    this.idHouse,
    this.date,
    this.price = 0.0,
    this.status,
  });

  int? id;
  int? idUser;
  int? idHouse;
  DateTime? date;
  double? price;
  String? status;

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
    id: json["id"],
    idUser: json["idUser"],
    idHouse: json["idHouse"],
    date: DateTime.parse(json["date"]),
    price: json["price"] != null ? json["price"].toDouble() : 0.0,
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idUser": idUser,
    "idHouse": idHouse,
    "date": date.toString(),
    "price": price,
    "status": status,
  };
}
