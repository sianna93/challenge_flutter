class UserModel{
  UserModel({
    this.id,
    this.name,
    this.lastname,
    this.adress,
    this.email,
    this.password,
  });

  int? id;
  String? name;
  String? lastname;
  String? adress;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["idUser"],
    name: json["name"],
    lastname: json["lastname"],
    //adress: json["adress"],
    adress: json["address"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    //"idUser": id,
    "name": name,
    "lastname": lastname,
    "adress": adress,
    "email": email,
    "password": password,
  };
}