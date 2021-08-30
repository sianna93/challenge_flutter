class HouseModel {
  HouseModel({
    this.idHouse,
    this.name,
    this.idPhoto,
    this.photo,
    this.user,
    this.avatar,
    this.rating,
    this.location,
    this.price,
    this.reviews,
    this.bedroom,
    this.menu,
    this.bathroom,
    this.description,
    this.utilities,
    this.aviable,
  });

  int? idHouse;
  String? name;
  int? idPhoto;
  String? photo;
  String? user;
  String? avatar;
  int? rating;
  String? location;
  int? price;
  int? reviews;
  int? bedroom;
  int? menu;
  int? bathroom;
  String? description;
  String? utilities;
  int? aviable;

  factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
    idHouse: json["idHouse"],
    name: json["name"],
    idPhoto: json["idPhoto"],
    photo: json["Photo"],
    user: json["user"],
    avatar: json["avatar"],
    rating: json["rating"],
    location: json["location"],
    price: json["price"],
    reviews: json["reviews"],
    bedroom: json["bedroom"],
    menu: json["menu"],
    bathroom: json["bathroom"],
    description: json["description"],
    utilities: json["utilities"],
    aviable: json["aviable"],
  );

  Map<String, dynamic> toJson() => {
    "idHouse": idHouse,
    "name": name,
    "idPhoto": idPhoto,
    "Photo": photo,
    "user": user,
    "avatar": avatar,
    "rating": rating,
    "location": location,
    "price": price,
    "reviews": reviews,
    "bedroom": bedroom,
    "menu": menu,
    "bathroom": bathroom,
    "description": description,
    "utilities": utilities,
    "aviable": aviable,
  };
}