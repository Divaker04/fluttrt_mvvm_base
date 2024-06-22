import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttrt_mvvm/data/app_exception.dart';
import 'package:fluttrt_mvvm/data/network/BaseApiService.dart';
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson=returnResponse(response);
   }on SocketException{
     throw FetchDataException("No Internet Connection");
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
      case 400:
      case 401:
      case 403:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException("Error occurred while server communication"+"with status code"+response.statusCode.toString());
    }
  }

}