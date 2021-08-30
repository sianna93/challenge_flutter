class RequestToken {
  bool? succes;
  String? requestToken;
  int? idUser;

  RequestToken({
    this.succes,
    this.requestToken,
    this.idUser,
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
    succes: json["success"],
    requestToken: json["request_token"],
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "success": succes,
    "request_token": requestToken,
    "id_user": idUser,
  };
}
