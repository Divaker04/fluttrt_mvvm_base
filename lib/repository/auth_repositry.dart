import 'package:fluttrt_mvvm/data/data_class/LogingData.dart';
import 'package:fluttrt_mvvm/data/network/NetworkApiService.dart';
import 'package:fluttrt_mvvm/resources/app_urls.dart';

import '../data/network/BaseApiService.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrls.LoginApi, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
