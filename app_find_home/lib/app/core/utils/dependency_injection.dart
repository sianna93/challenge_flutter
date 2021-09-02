import 'package:app_find_home/app/data/providers/authentication_provider.dart';
import 'package:app_find_home/app/data/providers/house_provider.dart';
import 'package:app_find_home/app/data/providers/local/storage_provider.dart';
import 'package:app_find_home/app/data/providers/user_provider.dart';
import 'package:app_find_home/app/data/repositories/authentication_repository.dart';
import 'package:app_find_home/app/data/repositories/house_repository.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class DependencyInjection{
  static void load(){

    //Aqui deberia ir el path global de las APIS


    //Providers
    // Se va a decalarar providers
    Get.put<AuthenticationProvider>(AuthenticationProvider());
    Get.put<UserProvider>(UserProvider());
    Get.put<HouseProvider>(HouseProvider());

    //Local
    Get.put<StorageProvider>(StorageProvider());

    //Repositories
    // Se va a decalarar repositories
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<UserRepository>(UserRepository());
    Get.put<HouseRepository>(HouseRepository());

    //Local
    Get.put<StorageRepository>(StorageRepository());
  }
}