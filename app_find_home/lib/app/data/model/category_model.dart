class CategoryModel {
  final int? id;
  final String? name;
  final String? path;

  CategoryModel({
    required this.id,
    required this.name,
    required this.path,
  });
}

final categories = [
  CategoryModel(
    id: 0,
    name: 'Home',
    path: 'assets/icons/house-menu.svg',
  ),
  CategoryModel(
    id: 1,
    name: 'Condominum',
    path: 'assets/icons/condominium.svg',
  ),
  CategoryModel(
    id: 2,
    name: 'Keys',
    path: 'assets/icons/keys.svg',
  ),
  CategoryModel(
    id: 3,
    name: 'Offers',
    path: 'assets/icons/menu-4.svg',
  ),
];