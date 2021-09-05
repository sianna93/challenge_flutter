import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/providers/local/storage_provider.dart';
import 'package:get/get.dart';

class StorageRepository{
  final _storageProvider = Get.find<StorageProvider>();

  Future<void> setSession({required RequestToken requestToken}) => _storageProvider.setSession(requestToken: requestToken);
  Future<RequestToken> getSession() => _storageProvider.getSession();
  Future<void> deleteSession() => _storageProvider.deleteSession();
}