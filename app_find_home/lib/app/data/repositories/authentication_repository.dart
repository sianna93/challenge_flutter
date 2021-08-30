 import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/providers/authentication_provider.dart';
import 'package:get/get.dart';


// puente de comunicación entre los providers y controllers
class AuthenticationRepository {
  // Inyección de dependencia
  // Busca una instancia ya creada
  final _apiProvider = Get.find<AuthenticationProvider>();

  //Get.find = Es lo mismo que instanciar el provider, para acceder a las propiedades
  // Se evita esto, para evitar alojar memoria en la app inecesaria, por cada provider
  // AuthenticationProvider instance = AuthenticationProvider();



  Future<RequestToken> authentication({
    required String email,
    required String password}) => _apiProvider.authentication(email: email, password: password);
}